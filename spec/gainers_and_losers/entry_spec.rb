require 'spec_helper'

describe GainersAndLosers::Entry do
  let!(:now)          { Time.now }
  let!(:current_time) { Time.local(now.year, now.month, now.day, 20, 0, 0) }

  before(:each) do
    @entry = GainersAndLosers::Entry.new('INTC', 'Intel Corporation', '26.15', '4:00PM EDT', 'Up', '0.08', '0.31%', '41,395,585')
  end
  
  describe '#symbol' do
    it 'returns the symbol passed in' do
      @entry.symbol.should == 'INTC'
    end
  end
  
  describe '#name' do
    it 'returns the name of the company' do
      @entry.name.should == 'Intel Corporation'
    end
  end
  
  describe '#price' do
    it 'returns the last trade' do
      @entry.price.should == 26.15
    end
  end
  
  describe '#last_trade_time' do
    it 'returns the last trade time' do
      @entry.last_trade_time.should == Time.local(now.year, now.month, now.day, 16, 0, 0)
    end
  end
  
  describe '#direction' do
    it 'returns the direction of the trade' do
      @entry.direction.should == 'Up'
    end
  end
  
  describe '#price_change' do
    context 'given a positive value' do
      before(:each) do
        @entry = GainersAndLosers::Entry.new('INTC', 'Intel Corporation', '26.15', '4:00PM EDT', 'Up', '0.08', '0.31%', '41,395,585')
      end
    
      it 'returns the price change from the previous day' do
        @entry.price_change.should == 0.08
      end
    end
    
    context 'given a negative value' do
      before(:each) do
        @entry = GainersAndLosers::Entry.new('INTC', 'Intel Corporation', '26.15', '4:00PM EDT', 'Down', '0.08', '0.31%', '41,395,585')
      end
    
      it 'returns the price change from the previous day' do
        @entry.price_change.should == -0.08
      end
    end
  end
  
  describe '#price_change_percentage' do
    context 'given a positive value' do
      before(:each) do
        @entry = GainersAndLosers::Entry.new('INTC', 'Intel Corporation', '26.15', '4:00PM EDT', 'Up', '0.08', '0.31%', '41,395,585')
      end
    
      it 'returns the price change percentage' do
        @entry.price_change_percentage.should == 0.31
      end
    end
    
    context 'given a negative value' do
      before(:each) do
        @entry = GainersAndLosers::Entry.new('INTC', 'Intel Corporation', '26.15', '4:00PM EDT', 'Down', '0.08', '0.31%', '41,395,585')
      end
    
      it 'returns the price change percentage' do
        @entry.price_change_percentage.should == -0.31
      end
    end
  end
  
  describe '#volume' do
    it 'returns the volume' do
      @entry.volume.should == 41395585
    end
  end
  
  describe '#positive?' do
    context 'given a positive value' do
      before(:each) do
        @entry = GainersAndLosers::Entry.new('INTC', 'Intel Corporation', '26.15', '4:00PM EDT', 'Up', '0.08', '0.31%', '41,395,585')
      end
    
      it 'returns true' do
        @entry.should be_positive
      end
    end
    
    context 'given a negative value' do
      before(:each) do
        @entry = GainersAndLosers::Entry.new('INTC', 'Intel Corporation', '26.15', '4:00PM EDT', 'Down', '0.08', '0.31%', '41,395,585')
      end
    
      it 'returns false' do
        @entry.should_not be_positive
      end
    end
  end
  
  describe '#negative?' do
    context 'given a positive value' do
      before(:each) do
        @entry = GainersAndLosers::Entry.new('INTC', 'Intel Corporation', '26.15', '4:00PM EDT', 'Up', '0.08', '0.31%', '41,395,585')
      end
    
      it 'returns false' do
        @entry.should_not be_negative
      end
    end
    
    context 'given a negative value' do
      before(:each) do
        @entry = GainersAndLosers::Entry.new('INTC', 'Intel Corporation', '26.15', '4:00PM EDT', 'Down', '0.08', '0.31%', '41,395,585')
      end
    
      it 'returns true' do
        @entry.should be_negative
      end
    end
  end
  
  describe '#[]' do
    it 'returns the value of the attribute' do
      @entry[:symbol].should                  == 'INTC'
      @entry[:name].should                    == 'Intel Corporation'
      @entry[:price].should                   == 26.15
      @entry[:last_trade_time].should         == Time.local(now.year, now.month, now.day, 16, 0, 0)
      @entry[:direction].should               == 'Up'
      @entry[:price_change].should            == 0.08
      @entry[:price_change_percentage].should == 0.31
      @entry[:volume].should                  == 41395585
    end
  end
  
  describe '#==' do
    context 'given identical entries' do
      before(:each) do
        @entry1 = GainersAndLosers::Entry.new('INTC', 'Intel Corporation', '26.15', '4:00PM EDT', 'Up', '0.08', '0.31%', '41,395,585')
        @entry2 = GainersAndLosers::Entry.new('INTC', 'Intel Corporation', '26.15', '4:00PM EDT', 'Up', '0.08', '0.31%', '41,395,585')
      end
      
      it 'returns true' do
        @entry1.should == @entry2
      end
    end
    
    context 'given two different entries' do
      before(:each) do
        @entry1 = GainersAndLosers::Entry.new('INTC', 'Intel Corporation', '26.15', '4:00PM EDT', 'Up', '0.08', '0.31%', '41,395,585')
        @entry2 = GainersAndLosers::Entry.new('INTC', 'Intel Corporation', '26.15', '4:00PM EDT', 'Down', '0.08', '0.31%', '41,395,585')
      end
      
      it 'returns false' do
        @entry1.should_not == @entry2
      end
    end
  end
end
