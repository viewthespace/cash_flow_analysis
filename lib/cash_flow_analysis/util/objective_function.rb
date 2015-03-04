module CashFlowAnalysis
  module Util
    class ObjectiveFunction
      def eps
        BigDecimal.new("1.0e-16")
      end

      def zero
        BigDecimal.new("0.0")
      end

      def one
        BigDecimal.new("1.0")
      end

      def two
        BigDecimal.new("2.0")
      end

      def ten
        BigDecimal.new("10.0")
      end

      def initialize(calculator, cash_flow_items)
        @calculator = calculator
        @cash_flow_items = cash_flow_items
      end

      def values(discount_rates)
        [calculator.calculate(discount_rates.first.round(15), cash_flow_items)]
      end

      private

      attr_reader :calculator
      attr_reader :cash_flow_items
    end
  end
end
