require 'spec_helper'

describe GainersAndLosers::MarketMovers::Actives do
  describe '#url' do
    context 'the default url' do
      it 'should return the correct url' do
        GainersAndLosers::MarketMovers::Actives.new().url.should == YAHOO_FINANCE_URL + ACTIVES_URL + '?' + ARGUMENT + '=' + US
      end
    end
    
    context 'given a market' do
      it 'should return the correct url' do
        GainersAndLosers::MarketMovers::Actives.new(NASDAQ).url.should == YAHOO_FINANCE_URL + ACTIVES_URL + '?' + ARGUMENT + '=' + NASDAQ
      end
    end
    
    context 'given a market that is not recognized' do
      it 'should raise and exception' do
        expect { GainersAndLosers::MarketMovers::Actives.new('giberish') }.should raise_error(ArgumentError)
      end
    end
  end
  
  describe '#entries' do
    before(:each) do
      url = File.expand_path('../../../files/actives.html', __FILE__)
      @parser = GainersAndLosers::MarketMovers::Actives.new()
      @parser.instance_variable_set(:@url, url)
      @entry1 = GainersAndLosers::MarketMovers::Entry.new('BAC', 'Bank of America Corporation Com', '7.17', '4:01PM EDT', 'Up', '0.19', '2.72%', '194,445,391')
      @entry2 = GainersAndLosers::MarketMovers::Entry.new('DELL', 'Dell Inc.', '12.49', '4:00PM EDT', 'Down', '2.59', '17.18%', '109,242,617')
    end
  
    it 'returns an array of entries' do
      @parser.entries.should == [@entry1, @entry2]
    end
  end
end
