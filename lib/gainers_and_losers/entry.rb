module GainersAndLosers
  class Entry
    
    attr_reader :symbol, :name, :price, :last_trade_time, :direction, :price_change, :price_change_percentage, :volume
    
    def initialize(symbol, name, price, last_trade_time, direction, price_change, price_change_percentage, volume)
      @symbol                   = symbol
      @name                     = name
      @price                    = price.to_f
      @last_trade_time          = parse_last_trade_time(last_trade_time)
      @direction                = direction
      @price_change             = price_change.to_f
      @price_change_percentage  = parse_price_change_percentage(price_change_percentage)
      @volume                   = parse_volume(volume)
    end
    
    def price_change
      @price_change * (negative? ? -1.0 : 1.0)
    end
    
    def price_change_percentage
      @price_change_percentage * (negative? ? -1.0 : 1.0)
    end
    
    def positive?
      @direction.downcase == 'up'
    end
    
    def negative?
      not positive?
    end
    
    def [](attr)
      self.send attr.to_sym 
    end
    
    def ==(other)
      (self.symbol                  == other.symbol                  &&
       self.name                    == other.name                    &&
       self.price                   == other.price                   &&
       self.last_trade_time         == other.last_trade_time         &&
       self.direction               == other.direction               &&
       self.price_change            == other.price_change            &&
       self.price_change_percentage == other.price_change_percentage &&
       self.volume                  == other.volume)
    end
    
    private
    
      def parse_last_trade_time(time)
        time_now = Time.new
        time = time[0..-5]
        am_pm = time[-2, 2]
        time_add = (am_pm == 'PM' ? 12 : 0)
        time_parts = time[0..-2].split(':')
        Time.local(time_now.year, time_now.month, time_now.day, time_parts[0].to_i + time_add, time_parts[1].to_i, 0)
      end
    
      def parse_price_change_percentage(percentage) 
        percentage.gsub('%', '').to_f
      end
      
      def parse_volume(volume)
        volume.gsub(',', '').to_i
      end
      
  end
end