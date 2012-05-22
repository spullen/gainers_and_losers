require 'nokogiri'
require 'open-uri'

module GainersAndLosers
  autoload :Version,    'gainers_and_losers/version'
  autoload :Constants,  'gainers_and_losers/constants'
  
  module MarketMovers
    autoload :Parser,     'gainers_and_losers/market_movers/parser'
    autoload :Entry,      'gainers_and_losers/market_movers/entry'
    autoload :Gainers,    'gainers_and_losers/market_movers/gainers'
    autoload :Losers,     'gainers_and_losers/market_movers/losers'
  end
end
