require 'spec_helper'

describe GainersAndLosers::MarketMovers::Losers do
  describe '#url' do
    context 'the default url' do
      it 'should return the correct url' do
        GainersAndLosers::MarketMovers::Losers.new().url.should == YAHOO_FINANCE_URL + LOSERS_URL + '?' + ARGUMENT + '=' + US
      end
    end
    
    context 'given a market' do
      it 'should return the correct url' do
        GainersAndLosers::MarketMovers::Losers.new(NASDAQ).url.should == YAHOO_FINANCE_URL + LOSERS_URL + '?' + ARGUMENT + '=' + NASDAQ
      end
    end
    
    context 'given a market that is not recognized' do
      it 'should raise and exception' do
        expect { GainersAndLosers::MarketMovers::Losers.new('giberish') }.should raise_error(ArgumentError)
      end
    end
  end
  
  describe '#entries' do
    before(:each) do
      url = File.expand_path('../../../files/losers.html', __FILE__)
      @parser = GainersAndLosers::MarketMovers::Losers.new()
      @parser.instance_variable_set(:@url, url)
      @entry1 = GainersAndLosers::MarketMovers::Entry.new('UVXY', 'ProShares Trust Ultra VIX Short', '18.56', '4:00PM EDT', 'Down', '5.52', '22.92%', '13,514,803')
      @entry2 = GainersAndLosers::MarketMovers::Entry.new('TVIX', 'VelocityShares Daily 2x VIX Sho', '8.72', '4:00PM EDT', 'Down', '2.08', '19.26%', '19,977,105')
    end
  
    it 'returns an array of entries' do
      @parser.entries.should == [@entry1, @entry2]
    end
  end
end
