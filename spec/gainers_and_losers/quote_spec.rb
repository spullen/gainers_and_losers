require 'spec_helper'

describe GainersAndLosers::Quote do
  let!(:ask) {}
  let!(:average_daily_volume) {}
  let!(:bid) {}
  let!(:ask_realtime) {}
  let!(:bid_realtime) {}
  let!(:book_value) {}
  let!(:change_percent_change) {}
  let!(:change) {}
  let!(:commission) {}
  let!(:change_realtime) {}
  let!(:after_hours_change_realtime) {}
  let!(:dividend_share) {}
  let!(:last_trade_date) {}
  let!(:trade_date) {}
  let!(:earnings_share) {}
  let!(:eps_estimate_current_year) {}
  let!(:eps_estimate_next_year) {}
  let!(:eps_estimate_next_quarter) {}
  let!(:days_low) {}
  let!(:days_high) {}
  let!(:year_low) {}
  let!(:year_high) {}
  let!(:holdings_gain_percent) {}
  let!(:annualized_gain) {}
  let!(:holdings_gain) {}
  let!(:holdings_gain_percent_realtime) {}
  let!(:more_info) {}
  let!(:order_book_realtime) {}
  let!(:market_capitalization) {}
  let!(:market_cap_realtime) {}
  let!(:ebitda) {}
  let!(:change_from_year_low) {}
  let!(:percent_change_from_year_low) {}
  let!(:last_trade_realtime_with_time) {}
  let!(:change_percent_realtime) {}
  let!(:change_from_year_high) {}
  let!(:percent_change_from_year_high) {}
  let!(:last_trade_with_time) {}
  let!(:last_trade_price_only) {}
  let!(:high_limit) {}
  let!(:low_limit) {}
  let!(:days_range) {}
  let!(:days_range_realtime) {}
  let!(:fifty_day_moving_average) {}
  let!(:two_hundred_day_moving_average) {}
  let!(:change_from_two_hundred_day_moving_average) {}
  let!(:percent_change_from_two_hundred_day_moving_average) {}
  let!(:change_from_fifty_day_moving_average) {}
  let!(:percent_change_from_fifty_day_moving_average) {}
  let!(:name) {}
  let!(:notes) {}
  let!(:open) {}
  let!(:previous_close) {}
  let!(:price_paid) {}
  let!(:change_in_percent) {}
  let!(:price_sales) {}
  let!(:price_book) {}
  let!(:ex_dividend_date) {}
  let!(:pe_ratio) {}
  let!(:dividend_pay_date) {}
  let!(:pe_ratio_realtime) {}
  let!(:peg_ratio) {}
  let!(:price_eps_estimate_current_year) {}
  let!(:price_eps_estimate_next_year) {}
  let!(:symbol) {}
  let!(:shares_owned) {}
  let!(:short_ratio) {}
  let!(:last_trade_time) {}
  let!(:ticker_trend) {}
  let!(:oneyr_target_price) {}
  let!(:volume) {}
  let!(:holdings_value) {}
  let!(:holdings_value_realtime) {}
  let!(:year_range) {}
  let!(:days_value_change) {}
  let!(:days_value_change_realtime) {}
  let!(:stock_exchange) {}
  let!(:dividend_yield) {}
  let!(:percent_change) {}

  before(:each) do
    @quote = GainersAndLosers::Quote.new() # TODO: initialize with real values from above
  end
  
  describe 'attributes' do
    it 'should have a getter defined for each attribute' do
      GainersAndLosers::Quote::ATTRIBUTES.each do |key, val|
        GainersAndLosers::Quote.instance_methods.should include(key)
      end
    end
  end
  
  describe 
  
end