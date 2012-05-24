require 'spec_helper'

describe GainersAndLosers::UnusualVolume::Rising do
  describe '#entries' do
    before(:each) do
      url = File.expand_path('../../../files/rising.html', __FILE__)
      @parser = GainersAndLosers::UnusualVolume::Rising.new()
      @parser.instance_variable_set(:@url, url)
      @entry1 = GainersAndLosers::UnusualVolume::Entry.new('PETM', 'PetSmart, Inc', '62.92', '4:00PM EDT', 'Up', '7.30', '13.12%', '714%')
      @entry2 = GainersAndLosers::UnusualVolume::Entry.new('RA', 'RailAmerica, Inc. Common Stock', '24.02', '4:01PM EDT', 'Up', '1.89', '8.54%', '334%')
    end
  
    it 'returns an array of entries' do
      @parser.entries.should == [@entry1, @entry2]
    end
  end
end
