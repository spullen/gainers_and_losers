module GainersAndLosers
  class Quote
    
    ATTRIBUTES = {
        :ask                                                    => 'Ask',
        :average_daily_volume                                   => 'AverageDailyVolume',
        :bid                                                    => 'Bid',
        :ask_realtime                                           => 'AskRealtime',
        :bid_realtime                                           => 'BidRealtime',
        :book_value                                             => 'BookValue',
        :change_percent_change                                  => 'Change_PercentChange',
        :change                                                 => 'Change',
        :commission                                             => 'Commission',
        :change_realtime                                        => 'ChangeRealtime',
        :after_hours_change_realtime                            => 'AfterHoursChangeRealtime',
        :dividend_share                                         => 'DividendShare',
        :last_trade_date                                        => 'LastTradeDate',
        :trade_date                                             => 'TradeDate',
        :earnings_share                                         => 'EarningsShare',
        :eps_estimate_current_year                              => 'EPSEstimateCurrentYear',
        :eps_estimate_next_year                                 => 'EPSEstimateNextYear',
        :eps_estimate_next_quarter                              => 'EPSEstimateNextQuarter',
        :days_low                                               => 'DaysLow',
        :days_high                                              => 'DaysHigh',
        :year_low                                               => 'YearLow',
        :year_high                                              => 'YearHigh',
        :holdings_gain_percent                                  => 'HoldingsGainPercent',
        :annualized_gain                                        => 'AnnualizedGain',
        :holdings_gain                                          => 'HoldingsGain',
        :holdings_gain_percent_realtime                         => 'HoldingsGainPercentRealtime',
        :holdings_gain_realtime                                 => 'HoldingsGainRealtime',
        :more_info                                              => 'MoreInfo',
        :order_book_realtime                                    => 'OrderBookRealtime',
        :market_capitalization                                  => 'MarketCapitalization',
        :market_cap_realtime                                    => 'MarketCapRealtime',
        :ebitda                                                 => 'EBITDA',
        :change_from_year_low                                   => 'ChangeFromYearLow',
        :percent_change_from_year_low                           => 'PercentChangeFromYearLow',
        :last_trade_realtime_with_time                          => 'LastTradeRealtimeWithTime',
        :change_percent_realtime                                => 'ChangePercentRealtime',
        :change_from_year_high                                  => 'ChangeFromYearHigh',
        :percent_change_from_year_high                          => 'PercebtChangeFromYearHigh',
        :last_trade_with_time                                   => 'LastTradeWithTime',
        :last_trade_price_only                                  => 'LastTradePriceOnly',
        :high_limit                                             => 'HighLimit',
        :low_limit                                              => 'LowLimit',
        :days_range                                             => 'DaysRange',
        :days_range_realtime                                    => 'DaysRangeRealtime',
        :fifty_day_moving_average                               => 'FiftydayMovingAverage',
        :two_hundred_day_moving_average                         => 'TwoHundreddayMovingAverage',
        :change_from_two_hundred_day_moving_average             => 'ChangeFromTwoHundreddayMovingAverage',
        :percent_change_from_two_hundred_day_moving_average     => 'PercentChangeFromTwoHundreddayMovingAverage',
        :change_from_fifty_day_moving_average                   => 'ChangeFromFiftydayMovingAverage',
        :percent_change_from_fifty_day_moving_average           => 'PercentChangeFromFiftydayMovingAverage',
        :name                                                   => 'Name',
        :notes                                                  => 'Notes',
        :open                                                   => 'Open',
        :previous_close                                         => 'PreviousClose',
        :price_paid                                             => 'PricePaid',
        :change_in_percent                                      => 'ChangeinPercent',
        :price_sales                                            => 'PriceSales',
        :price_book                                             => 'PriceBook',
        :ex_dividend_date                                       => 'ExDividendDate',
        :pe_ratio                                               => 'PERatio',
        :dividend_pay_date                                      => 'DividendPayDate',
        :pe_ratio_realtime                                      => 'PERatioRealtime',
        :peg_ratio                                              => 'PEGRatio',
        :price_eps_estimate_current_year                        => 'PriceEPSEstimateCurrentYear',
        :price_eps_estimate_next_year                           => 'PriceEPSEstimateNextYear',
        :symbol                                                 => 'Symbol',
        :shares_owned                                           => 'SharesOwned',
        :short_ratio                                            => 'ShortRatio',
        :last_trade_time                                        => 'LastTradeTime',
        :ticker_trend                                           => 'TickerTrend',
        :one_yr_target_price                                    => 'OneyrTargetPrice',
        :volume                                                 => 'Volume',
        :holdings_value                                         => 'HoldingsValue',
        :holdings_value_realtime                                => 'HoldingsValueRealtime',
        :year_range                                             => 'YearRange',
        :days_value_change                                      => 'DaysValueChange',
        :days_value_change_realtime                             => 'DaysValueChangeRealtime',
        :stock_exchange                                         => 'StockExchange',
        :dividend_yield                                         => 'DividendYield',
        :percent_change                                         => 'PercentChange'
     }
     
    ATTRIBUTES.each do |attribute_key, attribute|
      attr_reader attribute_key
        
      define_method(attribute_key) do
        instance_variable_get "@#{attribute_key}".to_sym
      end
    end
     
    def initialize(quote)
      parse_quote_entry(quote)
    end
     
    private
     
      def parse_quote_entry(quote)
        ATTRIBUTES.each do |attribute_key, element_key|
          value = quote.xpath("//" + element_key).pop
          value = value.nil? ? '' : value.inner_text
          instance_variable_set "@#{attribute_key}".to_sym, value
        end
      end
    
  end
end