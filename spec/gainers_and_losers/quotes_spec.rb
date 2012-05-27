require 'spec_helper'

describe GainersAndLosers::Quotes do
  before(:all) do
    quotes = Nokogiri::XML(File.open(File.expand_path('../../files/results.xml', __FILE__))).xpath("//results/quote")
    
    @quote1 = GainersAndLosers::Quote.new(quotes[0])
    @quote2 = GainersAndLosers::Quote.new(quotes[1])
    
    @q1 = GainersAndLosers::Quotes.new('INTC')
    @q2 = GainersAndLosers::Quotes.new('INTC', 'F')
    @q3 = GainersAndLosers::Quotes.new()
  end
  
  describe '#entries' do
    it 'returns quote entries' do
      @q1.stub(:get_xml).and_return(Nokogiri::XML(File.open(File.expand_path('../../files/result.xml', __FILE__))))
      @q1.entries.should == [@quote1]
      
      
      @q2.stub(:get_xml).and_return(Nokogiri::XML(File.open(File.expand_path('../../files/results.xml', __FILE__))))
      @q2.entries.should == [@quote1, @quote2]
    end
    
    context 'given no symbols to lookup' do
      it 'returns an empty array' do
        @q3.entries.should == []
      end
    end
  end
end