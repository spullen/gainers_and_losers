module GainersAndLosers
  module MarketMovers    
    class Gainers < GainersAndLosers::MarketMovers::Parser
      attr_reader :market
    
      def initialize(market=US)
        raise ArgumentError, 'market must be ' + MARKETS.join(', ') unless MARKETS.include?(market)
        @market = market
        @url = YAHOO_FINANCE_URL + GAINERS_URL + '?' + ARGUMENT + '=' + @market
        super(@url)
      end
      
    end
  end
end