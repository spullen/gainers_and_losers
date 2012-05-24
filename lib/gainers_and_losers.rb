require 'nokogiri'
require 'open-uri'
require 'net/http'

module GainersAndLosers
  autoload :Version,      'gainers_and_losers/version'
  autoload :Constants,    'gainers_and_losers/constants'
  autoload :Quote,        'gainers_and_losers/quote'
  autoload :Quotes,       'gainers_and_losers/quotes'
  
  module Parser
    autoload :Base,       'gainers_and_losers/parser/base'
  end
  
  module MarketMovers
    autoload :Parser,     'gainers_and_losers/market_movers/parser'
    autoload :Entry,      'gainers_and_losers/market_movers/entry'
    autoload :Gainers,    'gainers_and_losers/market_movers/gainers'
    autoload :Losers,     'gainers_and_losers/market_movers/losers'
    autoload :Actives,    'gainers_and_losers/market_movers/actives'
  end
  
  module UnusualVolume
    autoload :Parser,     'gainers_and_losers/unusual_volume/parser'
    autoload :Entry,      'gainers_and_losers/unusual_volume/entry'
    autoload :Rising,     'gainers_and_losers/unusual_volume/rising'
    autoload :Falling,    'gainers_and_losers/unusual_volume/falling'
  end
end
