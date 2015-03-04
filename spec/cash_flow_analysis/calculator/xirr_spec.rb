require "spec_helper"
require "ostruct"

module CashFlowAnalysis
  module Calculator
    describe Xirr do
      describe ".calculate" do
        describe "scenario 1" do
          let(:cash_flow_items) do
            [
              OpenStruct.new(date: Date.new(2008, 1, 1), amount: -10000),
              OpenStruct.new(date: Date.new(2008, 3, 1), amount: 2750),
              OpenStruct.new(date: Date.new(2008, 10, 30), amount: 4250),
              OpenStruct.new(date: Date.new(2009, 2, 15), amount: 3250),
              OpenStruct.new(date: Date.new(2009, 4, 1), amount: 2750)
            ]
          end

          it "calculates the XIRR based on the cash flow items" do
            expect(described_class.calculate(cash_flow_items).round(10)).to eq 0.3733625335
          end
        end

        describe "scenario 2" do
          let(:cash_flow_items) do
            [
              OpenStruct.new(date: Date.new(2008, 1, 1), amount: -10000.0),
              OpenStruct.new(date: Date.new(2008, 2, 4), amount: 2500.0),
              OpenStruct.new(date: Date.new(2008, 10, 30), amount: 4250.0),
              OpenStruct.new(date: Date.new(2009, 2, 15), amount: 3250.0),
              OpenStruct.new(date: Date.new(2014, 4, 1), amount: 2500.0),
              OpenStruct.new(date: Date.new(2015, 4, 1), amount: 2500.0),
              OpenStruct.new(date: Date.new(2016, 4, 1), amount: 2500.0),
              OpenStruct.new(date: Date.new(2017, 4, 1), amount: 2500.0)
            ]
          end

          it "calculates the XIRR based on the cash flow items" do
            expect(described_class.calculate(cash_flow_items).round(10)).to eq 0.2726361809
          end
        end

        describe "scenario 3" do
          let(:cash_flow_items) do
            [
              OpenStruct.new(amount: -20.9, date: Date.parse("2014-04-30")),
              OpenStruct.new(amount: 0, date: Date.parse("2014-05-30")),
              OpenStruct.new(amount: 4.583333333333333333, date: Date.parse("2014-06-30")),
              OpenStruct.new(amount: 4.583333333333333333, date: Date.parse("2014-07-30")),
              OpenStruct.new(amount: 4.583333333333333333, date: Date.parse("2014-08-30")),
              OpenStruct.new(amount: 4.583333333333333333, date: Date.parse("2014-09-30")),
              OpenStruct.new(amount: 4.583333333333333333, date: Date.parse("2014-10-30")),
              OpenStruct.new(amount: 4.583333333333333333, date: Date.parse("2014-11-30")),
              OpenStruct.new(amount: 4.583333333333333333, date: Date.parse("2014-12-30")),
              OpenStruct.new(amount: 4.583333333333333333, date: Date.parse("2015-01-30")),
              OpenStruct.new(amount: 4.583333333333333333, date: Date.parse("2015-02-28")),
              OpenStruct.new(amount: 4.583333333333333333, date: Date.parse("2015-03-30")),
              OpenStruct.new(amount: 4.583333333333333333, date: Date.parse("2015-04-30")),
              OpenStruct.new(amount: 4.72083333333333333299, date: Date.parse("2015-05-30")),
              OpenStruct.new(amount: 4.72083333333333333299, date: Date.parse("2015-06-30")),
              OpenStruct.new(amount: 4.72083333333333333299, date: Date.parse("2015-07-30")),
              OpenStruct.new(amount: 4.72083333333333333299, date: Date.parse("2015-08-30")),
              OpenStruct.new(amount: 4.72083333333333333299, date: Date.parse("2015-09-30")),
              OpenStruct.new(amount: 4.72083333333333333299, date: Date.parse("2015-10-30")),
              OpenStruct.new(amount: 4.72083333333333333299, date: Date.parse("2015-11-30")),
              OpenStruct.new(amount: 4.72083333333333333299, date: Date.parse("2015-12-30")),
              OpenStruct.new(amount: 4.72083333333333333299, date: Date.parse("2016-01-30")),
              OpenStruct.new(amount: 4.72083333333333333299, date: Date.parse("2016-02-29")),
              OpenStruct.new(amount: 4.72083333333333333299, date: Date.parse("2016-03-30")),
              OpenStruct.new(amount: 4.72083333333333333299, date: Date.parse("2016-04-30")),
              OpenStruct.new(amount: 4.8624583333333333329797, date: Date.parse("2016-05-30")),
              OpenStruct.new(amount: 4.8624583333333333329797, date: Date.parse("2016-06-30")),
              OpenStruct.new(amount: 4.8624583333333333329797, date: Date.parse("2016-07-30")),
              OpenStruct.new(amount: 4.8624583333333333329797, date: Date.parse("2016-08-30")),
              OpenStruct.new(amount: 4.8624583333333333329797, date: Date.parse("2016-09-30")),
              OpenStruct.new(amount: 4.8624583333333333329797, date: Date.parse("2016-10-30")),
              OpenStruct.new(amount: 4.8624583333333333329797, date: Date.parse("2016-11-30")),
              OpenStruct.new(amount: 4.8624583333333333329797, date: Date.parse("2016-12-30")),
              OpenStruct.new(amount: 4.8624583333333333329797, date: Date.parse("2017-01-30")),
              OpenStruct.new(amount: 4.8624583333333333329797, date: Date.parse("2017-02-28")),
              OpenStruct.new(amount: 4.8624583333333333329797, date: Date.parse("2017-03-30")),
              OpenStruct.new(amount: 4.8624583333333333329797, date: Date.parse("2017-04-30")),
              OpenStruct.new(amount: 5.008332083333333332969091, date: Date.parse("2017-05-30")),
              OpenStruct.new(amount: 5.008332083333333332969091, date: Date.parse("2017-06-30")),
              OpenStruct.new(amount: 5.008332083333333332969091, date: Date.parse("2017-07-30")),
              OpenStruct.new(amount: 5.008332083333333332969091, date: Date.parse("2017-08-30")),
              OpenStruct.new(amount: 5.008332083333333332969091, date: Date.parse("2017-09-30")),
              OpenStruct.new(amount: 5.008332083333333332969091, date: Date.parse("2017-10-30")),
              OpenStruct.new(amount: 5.008332083333333332969091, date: Date.parse("2017-11-30")),
              OpenStruct.new(amount: 5.008332083333333332969091, date: Date.parse("2017-12-30")),
              OpenStruct.new(amount: 5.008332083333333332969091, date: Date.parse("2018-01-30")),
              OpenStruct.new(amount: 5.008332083333333332969091, date: Date.parse("2018-02-28")),
              OpenStruct.new(amount: 5.008332083333333332969091, date: Date.parse("2018-03-30")),
              OpenStruct.new(amount: 5.008332083333333332969091, date: Date.parse("2018-04-30")),
              OpenStruct.new(amount: 5.15858204583333333295816373, date: Date.parse("2018-05-30")),
              OpenStruct.new(amount: 5.15858204583333333295816373, date: Date.parse("2018-06-30")),
              OpenStruct.new(amount: 5.15858204583333333295816373, date: Date.parse("2018-07-30")),
              OpenStruct.new(amount: 5.15858204583333333295816373, date: Date.parse("2018-08-30")),
              OpenStruct.new(amount: 5.15858204583333333295816373, date: Date.parse("2018-09-30")),
              OpenStruct.new(amount: 5.15858204583333333295816373, date: Date.parse("2018-10-30")),
              OpenStruct.new(amount: 5.15858204583333333295816373, date: Date.parse("2018-11-30")),
              OpenStruct.new(amount: 5.15858204583333333295816373, date: Date.parse("2018-12-30")),
              OpenStruct.new(amount: 5.15858204583333333295816373, date: Date.parse("2019-01-30")),
              OpenStruct.new(amount: 5.15858204583333333295816373, date: Date.parse("2019-02-28")),
              OpenStruct.new(amount: 5.15858204583333333295816373, date: Date.parse("2019-03-30")),
              OpenStruct.new(amount: 5.15858204583333333295816373, date: Date.parse("2019-04-30"))
            ]
          end

          it "calculates the XIRR based on the cash flow items" do
            expect(described_class.calculate(cash_flow_items).round(10)).to eq 6.7111752144
          end
        end

        describe " when the cash flow items are all positive" do
          let(:cash_flow_items) do
            [
              OpenStruct.new(date: Date.new(2008, 1, 1), amount: 1),
              OpenStruct.new(date: Date.new(2008, 3, 1), amount: 2750),
              OpenStruct.new(date: Date.new(2008, 10, 30), amount: 4250),
              OpenStruct.new(date: Date.new(2009, 2, 15), amount: 3250),
              OpenStruct.new(date: Date.new(2009, 4, 1), amount: 2750)
            ]
          end

          it "returns nil" do
            expect(described_class.calculate(cash_flow_items)).to be_nil
          end
        end

        describe "when the cash flow items are all negative" do
          let(:cash_flow_items) do
            [
              OpenStruct.new(date: Date.new(2008, 1, 1), amount: -1),
              OpenStruct.new(date: Date.new(2008, 3, 1), amount: -2750),
              OpenStruct.new(date: Date.new(2008, 10, 30), amount: -4250),
              OpenStruct.new(date: Date.new(2009, 2, 15), amount: -3250),
              OpenStruct.new(date: Date.new(2009, 4, 1), amount: -2750)
            ]
          end

          it "returns nil" do
            expect(described_class.calculate(cash_flow_items)).to be_nil
          end
        end

        describe "when all cash flow items are zero" do
          let(:cash_flow_items) do
            [
              OpenStruct.new(date: Date.new(2008, 1, 1), amount: 0),
              OpenStruct.new(date: Date.new(2008, 3, 1), amount: 0),
              OpenStruct.new(date: Date.new(2008, 10, 30), amount: 0),
              OpenStruct.new(date: Date.new(2009, 2, 15), amount: 0),
              OpenStruct.new(date: Date.new(2009, 4, 1), amount: 0)
            ]
          end

          it "returns nil" do
            expect(described_class.calculate(cash_flow_items)).to be_nil
          end
        end

        describe "when convergance isn't possible" do
          let(:cash_flow_items) do
            [
              OpenStruct.new(date: Date.new(2008, 1, 1), amount: -1),
              OpenStruct.new(date: Date.new(2008, 3, 1), amount: 0),
              OpenStruct.new(date: Date.new(2008, 10, 30), amount: 0),
              OpenStruct.new(date: Date.new(2009, 2, 15), amount: 0),
              OpenStruct.new(date: Date.new(2009, 4, 1), amount: 0)
            ]
          end

          it "raises a CalculationError when the calcuation fails" do
            expect { described_class.calculate(cash_flow_items) }.to raise_error(CalculationError)
          end
        end
      end
    end
  end
end
