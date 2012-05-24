require 'spec_helper'

describe GainersAndLosers::UnusualVolume::Falling do
  describe '#entries' do
    before(:each) do
      url = File.expand_path('../../../files/falling.html', __FILE__)
      @parser = GainersAndLosers::UnusualVolume::Falling.new()
      @parser.instance_variable_set(:@url, url)
      @entry1 = GainersAndLosers::UnusualVolume::Entry.new('EXLS', 'ExlService Holdings, Inc.', '23.00', '4:00PM EDT', 'Down', '1.33', '5.47%', '1,091%')
      @entry2 = GainersAndLosers::UnusualVolume::Entry.new('GCO', 'Genesco Inc. Common Stock', '69.82', '4:00PM EDT', 'Down', '1.09', '1.54%', '380%')
    end
    
    it 'returns an array of entries' do
      @parser.entries.should == [@entry1, @entry2]
    end
  end
end