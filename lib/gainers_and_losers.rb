require 'nokogiri'
require 'open-uri'

module GainersAndLosers
  autoload :Version,    'gainers_and_losers/version'
  autoload :Constants,  'gainers_and_losers/constants'
  autoload :Parser,     'gainers_and_losers/parser'
  autoload :Entry,      'gainers_and_losers/entry'
  autoload :Gainers,    'gainers_and_losers/gainers'
  autoload :Losers,     'gainers_and_losers/losers'
end
