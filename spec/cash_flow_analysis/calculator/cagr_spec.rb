require "spec_helper"

module CashFlowAnalysis
  module Calculator
    describe Cagr do
      describe ".calculate" do
        [
          { start_value: 25, end_value: 35, years: 4, cagr: 0.0877573059 },
          { start_value: 1.66666666666667, end_value: 1.9132775867544, years: 4, cagr: 0.0351 },
          { start_value: 0.25, end_value: 0.5, years: 10, cagr: 0.0717734625 },
          { start_value: 5, end_value: 7.25, years: 1, cagr: 0.45 },
          { start_value: 150.25, end_value: 250.35, years: 25, cagr: 0.0206323382 }
        ].each do |example|
          it "calculates a CAGR of #{example[:cagr]} when the start value is #{example[:start_value]}, the end value is #{example[:end_value]} over a term of #{example[:years]} years" do
            expect(described_class.calculate(example[:start_value], example[:end_value], example[:years]).round(10)).to eq example[:cagr]
          end
        end
      end
    end
  end
end
