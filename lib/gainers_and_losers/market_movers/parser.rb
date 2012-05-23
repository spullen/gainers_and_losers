module GainersAndLosers
  module MarketMovers
    class Parser < GainersAndLosers::Parser::Base
      
      protected
      
        def parse_entries
          entries = []
          document.xpath("//div[@id='yfitp']/table/tbody/tr").each do |row|
            row = Nokogiri::XML.fragment(row)
            data = row.search("td")
            
            symbol                  = data[0].content
            name                    = data[1].content.gsub('  ', ' ')
            price                   = data[2].content.split.first
            last_trade_time         = data[2].content.gsub(price, '').strip
            direction               = data[3].search("img").first['alt']
            price_change            = data[3].content.split.first
            price_change_percentage = data[3].content.split[1].gsub('(', '').gsub(')', '')
            volume                  = data[4].content
            
            entries << GainersAndLosers::MarketMovers::Entry.new(symbol, name, price, last_trade_time, direction, price_change, price_change_percentage, volume)
          end
          
          entries
        end
        
    end
  end
end