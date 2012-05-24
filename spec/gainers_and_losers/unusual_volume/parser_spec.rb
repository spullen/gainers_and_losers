require 'spec_helper'

describe GainersAndLosers::UnusualVolume::Parser do
  let!(:file_path) { File.expand_path('../../../files/rising.html', __FILE__) }
  
  before(:each) do
    @parser = GainersAndLosers::UnusualVolume::Parser.new(file_path)
    @entry1 = GainersAndLosers::UnusualVolume::Entry.new('PETM', 'PetSmart, Inc', '62.92', '4:00PM EDT', 'Up', '7.30', '13.12%', '714%')
    @entry2 = GainersAndLosers::UnusualVolume::Entry.new('RA', 'RailAmerica, Inc. Common Stock', '24.02', '4:01PM EDT', 'Up', '1.89', '8.54%', '334%')
  end
  
  describe '#entries' do
    it 'should return an array of GainersAndLosers::UnusualVolume::Entry objects' do
      @parser.entries.should == [@entry1, @entry2]
    end
  end
  
end