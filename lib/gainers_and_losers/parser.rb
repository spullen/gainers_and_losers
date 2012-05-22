module GainersAndLosers
  class Parser
    
    attr_reader :entries
  
    def initialize(url)
      @url = url
    end
    
    def entries
      @entries ||= parse_entries
    end
    
    private
    
      def parse_entries
        []
      end
  
  end
end