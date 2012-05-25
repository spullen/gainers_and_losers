require 'spec_helper'

describe GainersAndLosers::Quote do
  
  describe 'attributes' do
    it 'should have a getter defined for each attribute' do
      GainersAndLosers::Quote::ATTRIBUTES.each do |key, val|
        GainersAndLosers::Quote.instance_methods.should include(key)
      end
    end
  end
  
end