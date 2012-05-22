module GainersAndLosers
  module Constants
    YAHOO_FINANCE_URL = 'http://finance.yahoo.com'
    GAINERS_URL       = '/gainers'
    LOSERS_URL        = '/losers'
    
    ARGUMENT          = 'e'
    
    US                = 'us'
    NASDAQ            = 'o'
    APEX              = 'aq'
    NYSE              = 'nq'
    
    MARKETS           = %w{US, NASDAQ, APEX, NYSE}
  end
end