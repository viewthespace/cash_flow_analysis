require "bigdecimal/newton"

module CashFlowAnalysis
  module Calculator
    module Xirr
      extend Newton

      def self.calculate(cash_flow_items)
        return nil if cash_flow_items.map(&:amount).none? { |amount| amount >= 0 }
        return nil if cash_flow_items.map(&:amount).none? { |amount| amount < 0 }

        objective_function = Util::ObjectiveFunction.new(Xnpv, cash_flow_items)
        discount_rate_vector = [objective_function.one]
        nlsolve(objective_function, discount_rate_vector)
        discount_rate_vector.first
      end
    end
  end
end
