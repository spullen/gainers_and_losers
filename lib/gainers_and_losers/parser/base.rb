module GainersAndLosers
  module Parser
    class Base
      attr_reader :entries
    
      def initialize(url)
        @url = url
      end
      
      def entries
        @entries ||= parse_entries
      end
      
      protected
      
        def parse_entries
          raise NotImplementedError.new 'You need to override the parse_entries method.'
        end
        
        def document
          @document ||= Nokogiri::HTML(open(@url))
        end
    end
  end
end