module GainersAndLosers
  module MarketMovers    
    class Gainers
      include GainersAndLosers::Constants
      
      attr_reader :url, :market, :entries
    
      def initialize(market=US)
        raise ArgumentError, 'market must be ' + MARKETS.join(', ') unless MARKETS.include?(market)
        @market = market
        @url = YAHOO_FINANCE_URL + GAINERS_URL + '?' + ARGUMENT + '=' + @market
      end
      
      def entries
        @entries ||= get_entries
      end
      
      private
      
        def get_entries
          parser = GainersAndLosers::MarketMovers::Parser.new(@url)
          parser.entries
        end
    
    end
  end
end