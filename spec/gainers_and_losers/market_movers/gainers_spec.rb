require 'spec_helper'

describe GainersAndLosers::MarketMovers::Gainers do
  describe '#url' do
    context 'the default url' do
      it 'should return the correct url' do
        GainersAndLosers::MarketMovers::Gainers.new().url.should == YAHOO_FINANCE_URL + GAINERS_URL + '?' + ARGUMENT + '=' + US
      end
    end
    
    context 'given a market' do
      it 'should return the correct url' do
        GainersAndLosers::MarketMovers::Gainers.new(NASDAQ).url.should == YAHOO_FINANCE_URL + GAINERS_URL + '?' + ARGUMENT + '=' + NASDAQ
      end
    end
    
    context 'given a market that is not recognized' do
      it 'should raise and exception' do
        expect { GainersAndLosers::MarketMovers::Gainers.new('giberish') }.should raise_error(ArgumentError)
      end
    end
  end
  
  describe '#entries' do
    before(:each) do
      url = File.expand_path('../../../files/gainers.html', __FILE__)
      @parser = GainersAndLosers::MarketMovers::Gainers.new()
      @parser.instance_variable_set(:@url, url)
      @entry1 = GainersAndLosers::MarketMovers::Entry.new('CBE', 'Cooper Industries, plc (Irelan', '69.88', '4:00PM EDT', 'Up', '14.04', '25.14%', '25,734,609')
      @entry2 = GainersAndLosers::MarketMovers::Entry.new('ROSG', 'Rosetta Genomics Ltd.', '6.86', '4:00PM EDT', 'Up', '1.36', '24.73%', '4,371,356')
    end
  
    it 'returns an array of entries' do
      @parser.entries.should == [@entry1, @entry2]
    end
  end
end
