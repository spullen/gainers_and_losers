module GainersAndLosers
  module Constants
    YAHOO_FINANCE_URL   = 'http://finance.yahoo.com'
    GAINERS_URL         = '/gainers'
    LOSERS_URL          = '/losers'
    ACTIVES_URL         = '/actives'
    RISING_URL          = '/unusualvolume/rising'
    FALLING_URL         = '/unusualvolume/falling'
    
    ARGUMENT            = 'e'
    
    US                  = 'us'
    NASDAQ              = 'o'
    APEX                = 'aq'
    NYSE                = 'nq'
    
    MARKETS             = [US, NASDAQ, APEX, NYSE]
  end
end