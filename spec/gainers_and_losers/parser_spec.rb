require 'spec_helper'

describe GainersAndLosers::Parser do
  let!(:file_path) { File.expand_path('../../files/gainers.html', __FILE__) }
  
  before(:each) do
    @parser = GainersAndLosers::Parser.new(file_path)
    @entry1 = GainersAndLosers::Entry.new('CBE', 'Cooper Industries, plc (Irelan', '69.88', '4:00PM EDT', 'Up', '14.04', '25.14%', '25,734,609')
    @entry2 = GainersAndLosers::Entry.new('ROSG', 'Rosetta Genomics Ltd.', '6.86', '4:00PM EDT', 'Up', '1.36', '24.73%', '4,371,356')
  end
  
  describe '#entries' do
    it 'should return an array of GainersAndLosers::Entry objects' do
      @parser.entries.should == [@entry1, @entry2]
    end
  end
  
end