module CashFlowAnalysis
  module Calculator
    module Cagr
      # Calculates the {http://en.wikipedia.org/wiki/Compound_annual_growth_rate CAGR} based on a start value, end value, and a term.
      #
      # @param start_value [Numeric] the start value
      # @param end_value [Numeric] the end value
      # @param years [Fixnum] the number of years
      # @return [Numeric] the year over year growth rate
      def self.calculate(start_value, end_value, years)
        ((end_value.to_f / start_value) ** (1.0 / (years))) - 1
      end
    end
  end
end
