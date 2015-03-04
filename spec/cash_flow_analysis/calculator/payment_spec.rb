require "spec_helper"

module CashFlowAnalysis
  module Calculator
    describe Payment do
      describe ".calculate" do
        [
          { principal: 10000, term: 60, per_period_rate: 0.025, payment: 323.5339590006 },
          { principal: 250000, term: 240, per_period_rate: 0.008, payment: 2346.677544 },
          { principal: 1000, term: 6, per_period_rate: 0.001, payment: 167.2504858679 },
          { principal: 25, term: 111, per_period_rate: 0.025, payment: 0.6681016065 },
          { principal: 525, term: 55, per_period_rate: 0.5, payment: 262.5000000542 }
        ].each do |example|
          it "calculates a payment of #{example[:payment]} for a principal of #{example[:principal]} with a per-period rate of #{example[:per_period_rate]} over a term of #{example[:term]} periods" do
            expect(described_class.calculate(example[:principal], example[:term], example[:per_period_rate]).round(10)).to eq example[:payment]
          end
        end
      end
    end
  end
end
