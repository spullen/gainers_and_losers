require 'nokogiri'
require 'open-uri'

module GainersAndLosers
  autoload :Version,    'gainers_and_losers/version'
  autoload :Constants,  'gainers_and_losers/constants'
  
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
end
