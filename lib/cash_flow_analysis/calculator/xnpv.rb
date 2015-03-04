module CashFlowAnalysis
  module Calculator
    module Xnpv
      def self.calculate(discount_rate, cash_flow_items)
        start_date = cash_flow_items.first.date

        cash_flow_items.inject(0.0) do |sum, item|
          sum += item.amount / ((1 + discount_rate) ** ((item.date - start_date).to_i / 365.0))
        end
      end
    end
  end
end
