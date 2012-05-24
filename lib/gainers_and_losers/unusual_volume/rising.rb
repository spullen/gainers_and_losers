module GainersAndLosers
  module UnusualVolume
    class Rising < GainersAndLosers::UnusualVolume::Parser
      
      def initialize
        @url = YAHOO_FINANCE_URL + RISING_URL
        super(@url)
      end
      
    end
  end
end