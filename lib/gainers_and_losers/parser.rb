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
        doc = retrieve_document

        entries = []
        doc.xpath("//div[@id='yfitp']/table/tbody/tr").each do |row|
          row = Nokogiri::XML.fragment(row)
        end
        
        entries
      end
      
      def retrieve_document
        Nokogiri::HTML(open(@url))
      end
  
  end
end