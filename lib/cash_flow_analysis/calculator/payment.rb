module CashFlowAnalysis
  module Calculator
    module Payment
      # Calculates the {http://en.wikipedia.org/wiki/Mortgage_calculator payment for a loan}, assuming fixed payments and rates.
      #
      # @param principal [Numeric] the present value of the loan
      # @param term [Fixnum] the term of the load
      # @param per_period_rate [Numeric] the interest rate per period
      # @return [Numeric] the payment required per period
      def self.calculate(principal, term, per_period_rate)
        (per_period_rate * principal) / (1 - ((1 + per_period_rate) ** (-1 * term)))
      end
    end
  end
end
