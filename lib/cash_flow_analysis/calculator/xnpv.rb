module CashFlowAnalysis
  module Calculator
    module Xnpv
      def self.calculate(discount_rate, cash_flow_items)
        start_date = cash_flow_items.first.date

        cash_flow_items.inject(0) do |sum, item|
          days_since_start = (item.date - start_date).to_i
          sum += item.amount / ((1 + discount_rate) ** (days_since_start / 365.0))
        end
      end
    end
  end
end
