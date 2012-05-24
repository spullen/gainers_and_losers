module GainersAndLosers
  module Constants
    YAHOO_FINANCE_URL     = 'http://finance.yahoo.com'
    GAINERS_URL           = '/gainers'
    LOSERS_URL            = '/losers'
    ACTIVES_URL           = '/actives'
    RISING_URL            = '/unusualvolume/rising'
    FALLING_URL           = '/unusualvolume/falling'
    
    ARGUMENT              = 'e'
    
    US                    = 'us'
    NASDAQ                = 'o'
    APEX                  = 'aq'
    NYSE                  = 'nq'
    
    MARKETS               = [US, NASDAQ, APEX, NYSE]
    
    YAHOO_FINANCE_API_URL = 'http://query.yahooapis.com/v1/public/yql'
    YAHOO_FINANCE_FORMAT  = 'xml'                                                 # format=xml
    YAHOO_FINANCE_QUERY   = 'select * from yahoo.finance.quotes where symbol in ' # q=select * from yahoo.finance.quotes where symbol in ("intc", "fb", ...)
  end
end