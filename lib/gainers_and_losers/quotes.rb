module GainersAndLosers
  class Quotes
    include GainersAndLosers::Constants
    
    attr_reader :symbols
    
    def initialize(*symbols)
      @symbols = symbols.join(', ')
    end
    
    def entries
      return @entries if defined?(@entries)
      @entries = get_entries
    end
    
    private
    
      def get_entries
        e = []
        get_xml.search("//results/quote").each do |result|
          e << GainersAndLosers::Quote.new(result)
        end
        e
      end
      
      def get_xml
        uri = URI.parse(YAHOO_FINANCE_API_URL)
        
        query = YAHOO_FINANCE_QUERY + '("' + @symbols + '")'
        
        params = {
          :format => YAHOO_FINANCE_FORMAT,
          :env    => YAHOO_FINANCE_DB,
          :q      => query
        }
        
        uri.query = URI.encode_www_form(params)
        result = Net::HTTP.get_response(uri)
        
        return Nokogiri::XML(result.body)
      end
    
  end
end