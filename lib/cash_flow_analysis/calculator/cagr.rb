module CashFlowAnalysis
  module Calculator
    module Cagr
      def self.calculate(start_value, end_value, years)
        ((end_value.to_f / start_value) ** (1.0 / (years))) - 1
      end
    end
  end
end
