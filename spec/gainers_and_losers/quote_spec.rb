require 'spec_helper'

describe GainersAndLosers::Quote do
  let!(:expected) { { :ask =>  '25.74',
                      :average_daily_volume => '37148700',
                      :bid => '25.73',
                      :ask_realtime => '25.74',
                      :bid_realtime => '25.73',
                      :book_value => '9.341',
                      :change_percent_change => '+0.21 - +0.83%',
                      :change => '+0.21',
                      :commission => '',
                      :change_realtime => '+0.21',
                      :after_hours_change_realtime => 'N/A - N/A',
                      :dividend_share => '0.84',
                      :last_trade_date => '5/24/2012',
                      :trade_date => '',
                      :earnings_share => '2.364',
                      :eps_estimate_current_year => '2.50',
                      :eps_estimate_next_year => '2.69',
                      :eps_estimate_next_quarter => '0.67',
                      :days_low => '25.31',
                      :days_high => '25.78',
                      :year_low => '19.16',
                      :year_high => '29.27',
                      :holdings_gain_percent => '- - -',
                      :annualized_gain => '',
                      :holdings_gain => '',
                      :holdings_gain_percent_realtime => 'N/A - N/A',
                      :holdings_gain_realtime => '',
                      :more_info => 'cnsprmiIed',
                      :order_book_realtime => '',
                      :market_capitalization => '129.0B',
                      :market_cap_realtime => '',
                      :ebitda => '23.536B',
                      :change_from_year_low => '+6.49',
                      :percent_change_from_year_low => '+33.87%',
                      :last_trade_realtime_with_time => 'N/A - <b>25.65</b>',
                      :change_percent_realtime => 'N/A - +0.83%',
                      :change_from_year_high => '-3.62', 
                      :percent_change_from_year_high => '-12.37%',
                      :last_trade_with_time => '4:00pm - <b>25.65</b>',
                      :last_trade_price_only => '25.65',
                      :high_limit => '',
                      :low_limit => '',
                      :days_range => '25.31 - 25.78',
                      :days_range_realtime => 'N/A - N/A',
                      :fifty_day_moving_average => '27.5837',
                      :two_hundred_day_moving_average => '26.2712',
                      :change_from_two_hundred_day_moving_average => '-0.6212',
                      :percent_change_from_two_hundred_day_moving_average => '-2.36%',
                      :change_from_fifty_day_moving_average => '-1.9337',
                      :percent_change_from_fifty_day_moving_average => '-7.01%',
                      :name => 'Intel Corporation',
                      :notes => '',
                      :open => '25.59',
                      :previous_close => '25.44',
                      :price_paid => '',
                      :change_in_percent => '+0.83%',
                      :price_sales => '2.37',
                      :price_book => '2.72',
                      :ex_dividend_date => 'May  3',
                      :pe_ratio => '10.76',
                      :dividend_pay_date => 'Jun  1',
                      :pe_ratio_realtime => '',
                      :peg_ratio => '0.88',
                      :price_eps_estimate_current_year => '10.18',
                      :price_eps_estimate_next_year => '9.46',
                      :symbol => 'INTC',
                      :shares_owned => '',
                      :short_ratio => '2.50',
                      :last_trade_time => '4:00pm',
                      :ticker_trend => '&nbsp;======&nbsp;',
                      :one_yr_target_price => '29.74',
                      :volume => '37130300',
                      :holdings_value => '',
                      :holdings_value_realtime => '',
                      :year_range => '19.16 - 29.27',
                      :days_value_change => '- - +0.83%',
                      :days_value_change_realtime => 'N/A - N/A',
                      :stock_exchange => 'NasdaqNM',
                      :dividend_yield => '3.30',
                      :percent_change => '+0.83%' } }
  
  
  #let!(:quotes) { Nokogiri::XML(File.open(File.expand_path('../../files/results.xml', __FILE__))).xpath('//quote') }
  #let!(:quote1) { GainersAndLosers::Quote.new(quotes.first) }
  #let!(:quote2) { GainersAndLosers::Quote.new(quotes.last) }
  
  before(:all) do
    quotes = Nokogiri::XML(File.open(File.expand_path('../../files/results.xml', __FILE__))).xpath('//results/quote')
    
    @quote1 = GainersAndLosers::Quote.new(quotes[0])
    @quote2 = GainersAndLosers::Quote.new(quotes[1])
  end
  
  describe 'attributes' do
    it 'should have a getter defined for each attribute' do
      GainersAndLosers::Quote::ATTRIBUTES.each do |key, val|
        GainersAndLosers::Quote.instance_methods.should include(key)
      end
    end
    
    it 'should parse and set the correct value' do
      expected.each do |attribute, expected_val|
        @quote1.send(attribute).should == expected_val
      end
    end
  end
  
  describe '#==' do
    context 'given two quote entries that are the same' do
      it 'returns true' do
        @quote1.should == @quote1
      end
    end
    
    context 'given two quote entries that are not the same' do
      it 'returns false' do
        @quote1.should_not == @quote2
      end
    end
  end
  
end