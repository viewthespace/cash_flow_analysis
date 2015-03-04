module CashFlowAnalysis
  module Calculator
    module Payment
      def self.calculate(principal, term, per_period_rate)
        (per_period_rate * principal) / (1 - ((1 + per_period_rate) ** (-1 * term)))
      end
    end
  end
end
