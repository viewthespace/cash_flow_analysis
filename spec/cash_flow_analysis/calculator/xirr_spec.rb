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

        describe "scenario 4" do
          let(:cash_flow_items) do
            [
              OpenStruct.new(date: Date.parse("2015-03-06"), amount: -115.45),
              OpenStruct.new(date: Date.parse("2015-04-06"), amount: 0.0),
              OpenStruct.new(date: Date.parse("2015-05-06"), amount: 0.0),
              OpenStruct.new(date: Date.parse("2015-06-06"), amount: 0.0),
              OpenStruct.new(date: Date.parse("2015-07-06"), amount: 0.0),
              OpenStruct.new(date: Date.parse("2015-08-06"), amount: 0.0),
              OpenStruct.new(date: Date.parse("2015-09-06"), amount: 0.0),
              OpenStruct.new(date: Date.parse("2015-10-06"), amount: 0.0),
              OpenStruct.new(date: Date.parse("2015-11-06"), amount: 0.0),
              OpenStruct.new(date: Date.parse("2015-12-06"), amount: 0.0),
              OpenStruct.new(date: Date.parse("2016-01-06"), amount: 0.0),
              OpenStruct.new(date: Date.parse("2016-02-06"), amount: 2.041666666666666666666666667),
              OpenStruct.new(date: Date.parse("2016-03-06"), amount: 2.041666666666666666666666667),
              OpenStruct.new(date: Date.parse("2016-04-06"), amount: 2.092708333333333333333333333675),
              OpenStruct.new(date: Date.parse("2016-05-06"), amount: 2.092708333333333333333333333675),
              OpenStruct.new(date: Date.parse("2016-06-06"), amount: 2.092708333333333333333333333675),
              OpenStruct.new(date: Date.parse("2016-07-06"), amount: 2.092708333333333333333333333675),
              OpenStruct.new(date: Date.parse("2016-08-06"), amount: 2.092708333333333333333333333675),
              OpenStruct.new(date: Date.parse("2016-09-06"), amount: 2.092708333333333333333333333675),
              OpenStruct.new(date: Date.parse("2016-10-06"), amount: 2.092708333333333333333333333675),
              OpenStruct.new(date: Date.parse("2016-11-06"), amount: 2.092708333333333333333333333675),
              OpenStruct.new(date: Date.parse("2016-12-06"), amount: 2.092708333333333333333333333675),
              OpenStruct.new(date: Date.parse("2017-01-06"), amount: 2.092708333333333333333333333675),
              OpenStruct.new(date: Date.parse("2017-02-06"), amount: 2.092708333333333333333333333675),
              OpenStruct.new(date: Date.parse("2017-03-06"), amount: 2.092708333333333333333333333675),
              OpenStruct.new(date: Date.parse("2017-04-06"), amount: 2.145026041666666666666666667016875),
              OpenStruct.new(date: Date.parse("2017-05-06"), amount: 2.145026041666666666666666667016875),
              OpenStruct.new(date: Date.parse("2017-06-06"), amount: 2.145026041666666666666666667016875),
              OpenStruct.new(date: Date.parse("2017-07-06"), amount: 2.145026041666666666666666667016875),
              OpenStruct.new(date: Date.parse("2017-08-06"), amount: 2.145026041666666666666666667016875),
              OpenStruct.new(date: Date.parse("2017-09-06"), amount: 2.145026041666666666666666667016875),
              OpenStruct.new(date: Date.parse("2017-10-06"), amount: 2.145026041666666666666666667016875),
              OpenStruct.new(date: Date.parse("2017-11-06"), amount: 2.145026041666666666666666667016875),
              OpenStruct.new(date: Date.parse("2017-12-06"), amount: 2.145026041666666666666666667016875),
              OpenStruct.new(date: Date.parse("2018-01-06"), amount: 2.145026041666666666666666667016875),
              OpenStruct.new(date: Date.parse("2018-02-06"), amount: 2.145026041666666666666666667016875),
              OpenStruct.new(date: Date.parse("2018-03-06"), amount: 2.145026041666666666666666667016875),
              OpenStruct.new(date: Date.parse("2018-04-06"), amount: 2.198651692708333333333333333692296875),
              OpenStruct.new(date: Date.parse("2018-05-06"), amount: 2.198651692708333333333333333692296875),
              OpenStruct.new(date: Date.parse("2018-06-06"), amount: 2.198651692708333333333333333692296875),
              OpenStruct.new(date: Date.parse("2018-07-06"), amount: 2.198651692708333333333333333692296875),
              OpenStruct.new(date: Date.parse("2018-08-06"), amount: 2.198651692708333333333333333692296875),
              OpenStruct.new(date: Date.parse("2018-09-06"), amount: 2.198651692708333333333333333692296875),
              OpenStruct.new(date: Date.parse("2018-10-06"), amount: 2.198651692708333333333333333692296875),
              OpenStruct.new(date: Date.parse("2018-11-06"), amount: 2.198651692708333333333333333692296875),
              OpenStruct.new(date: Date.parse("2018-12-06"), amount: 2.198651692708333333333333333692296875),
              OpenStruct.new(date: Date.parse("2019-01-06"), amount: 2.198651692708333333333333333692296875),
              OpenStruct.new(date: Date.parse("2019-02-06"), amount: 2.198651692708333333333333333692296875),
              OpenStruct.new(date: Date.parse("2019-03-06"), amount: 2.198651692708333333333333333692296875),
              OpenStruct.new(date: Date.parse("2019-04-06"), amount: 2.253617985026041666666666667034604296875),
              OpenStruct.new(date: Date.parse("2019-05-06"), amount: 2.253617985026041666666666667034604296875),
              OpenStruct.new(date: Date.parse("2019-06-06"), amount: 2.253617985026041666666666667034604296875),
              OpenStruct.new(date: Date.parse("2019-07-06"), amount: 2.253617985026041666666666667034604296875),
              OpenStruct.new(date: Date.parse("2019-08-06"), amount: 2.253617985026041666666666667034604296875),
              OpenStruct.new(date: Date.parse("2019-09-06"), amount: 2.253617985026041666666666667034604296875),
              OpenStruct.new(date: Date.parse("2019-10-06"), amount: 2.253617985026041666666666667034604296875),
              OpenStruct.new(date: Date.parse("2019-11-06"), amount: 2.253617985026041666666666667034604296875),
              OpenStruct.new(date: Date.parse("2019-12-06"), amount: 2.253617985026041666666666667034604296875),
              OpenStruct.new(date: Date.parse("2020-01-06"), amount: 2.253617985026041666666666667034604296875),
              OpenStruct.new(date: Date.parse("2020-02-06"), amount: 2.253617985026041666666666667034604296875),
              OpenStruct.new(date: Date.parse("2020-03-06"), amount: 2.253617985026041666666666667034604296875),
              OpenStruct.new(date: Date.parse("2020-04-06"), amount: 2.309958434651692708333333333710469404296875),
              OpenStruct.new(date: Date.parse("2020-05-06"), amount: 2.309958434651692708333333333710469404296875),
              OpenStruct.new(date: Date.parse("2020-06-06"), amount: 2.309958434651692708333333333710469404296875),
              OpenStruct.new(date: Date.parse("2020-07-06"), amount: 2.309958434651692708333333333710469404296875),
              OpenStruct.new(date: Date.parse("2020-08-06"), amount: 2.309958434651692708333333333710469404296875),
              OpenStruct.new(date: Date.parse("2020-09-06"), amount: 2.309958434651692708333333333710469404296875),
              OpenStruct.new(date: Date.parse("2020-10-06"), amount: 2.309958434651692708333333333710469404296875),
              OpenStruct.new(date: Date.parse("2020-11-06"), amount: 2.309958434651692708333333333710469404296875),
              OpenStruct.new(date: Date.parse("2020-12-06"), amount: 2.309958434651692708333333333710469404296875),
              OpenStruct.new(date: Date.parse("2021-01-06"), amount: 2.309958434651692708333333333710469404296875),
              OpenStruct.new(date: Date.parse("2021-02-06"), amount: 2.309958434651692708333333333710469404296875),
              OpenStruct.new(date: Date.parse("2021-03-06"), amount: 2.309958434651692708333333333710469404296875),
              OpenStruct.new(date: Date.parse("2021-04-06"), amount: 2.367707395517985026041666667053231139404296875),
              OpenStruct.new(date: Date.parse("2021-05-06"), amount: 2.367707395517985026041666667053231139404296875),
              OpenStruct.new(date: Date.parse("2021-06-06"), amount: 2.367707395517985026041666667053231139404296875),
              OpenStruct.new(date: Date.parse("2021-07-06"), amount: 2.367707395517985026041666667053231139404296875),
              OpenStruct.new(date: Date.parse("2021-08-06"), amount: 2.367707395517985026041666667053231139404296875),
              OpenStruct.new(date: Date.parse("2021-09-06"), amount: 2.367707395517985026041666667053231139404296875),
              OpenStruct.new(date: Date.parse("2021-10-06"), amount: 2.367707395517985026041666667053231139404296875),
              OpenStruct.new(date: Date.parse("2021-11-06"), amount: 2.367707395517985026041666667053231139404296875),
              OpenStruct.new(date: Date.parse("2021-12-06"), amount: 2.367707395517985026041666667053231139404296875),
              OpenStruct.new(date: Date.parse("2022-01-06"), amount: 2.367707395517985026041666667053231139404296875),
              OpenStruct.new(date: Date.parse("2022-02-06"), amount: 2.367707395517985026041666667053231139404296875),
              OpenStruct.new(date: Date.parse("2022-03-06"), amount: 2.367707395517985026041666667053231139404296875),
              OpenStruct.new(date: Date.parse("2022-04-06"), amount: 2.426900080405934651692708333729561917889404296875),
              OpenStruct.new(date: Date.parse("2022-05-06"), amount: 2.426900080405934651692708333729561917889404296875),
              OpenStruct.new(date: Date.parse("2022-06-06"), amount: 2.426900080405934651692708333729561917889404296875),
              OpenStruct.new(date: Date.parse("2022-07-06"), amount: 2.426900080405934651692708333729561917889404296875),
              OpenStruct.new(date: Date.parse("2022-08-06"), amount: 2.426900080405934651692708333729561917889404296875),
              OpenStruct.new(date: Date.parse("2022-09-06"), amount: 2.426900080405934651692708333729561917889404296875),
              OpenStruct.new(date: Date.parse("2022-10-06"), amount: 2.426900080405934651692708333729561917889404296875),
              OpenStruct.new(date: Date.parse("2022-11-06"), amount: 2.426900080405934651692708333729561917889404296875),
              OpenStruct.new(date: Date.parse("2022-12-06"), amount: 2.426900080405934651692708333729561917889404296875),
              OpenStruct.new(date: Date.parse("2023-01-06"), amount: 2.426900080405934651692708333729561917889404296875),
              OpenStruct.new(date: Date.parse("2023-02-06"), amount: 2.426900080405934651692708333729561917889404296875),
              OpenStruct.new(date: Date.parse("2023-03-06"), amount: 2.426900080405934651692708333729561917889404296875),
              OpenStruct.new(date: Date.parse("2023-04-06"), amount: 2.487572582416083017985026042072800965836639404296875),
              OpenStruct.new(date: Date.parse("2023-05-06"), amount: 2.487572582416083017985026042072800965836639404296875),
              OpenStruct.new(date: Date.parse("2023-06-06"), amount: 2.487572582416083017985026042072800965836639404296875),
              OpenStruct.new(date: Date.parse("2023-07-06"), amount: 2.487572582416083017985026042072800965836639404296875),
              OpenStruct.new(date: Date.parse("2023-08-06"), amount: 2.487572582416083017985026042072800965836639404296875),
              OpenStruct.new(date: Date.parse("2023-09-06"), amount: 2.487572582416083017985026042072800965836639404296875),
              OpenStruct.new(date: Date.parse("2023-10-06"), amount: 2.487572582416083017985026042072800965836639404296875),
              OpenStruct.new(date: Date.parse("2023-11-06"), amount: 2.487572582416083017985026042072800965836639404296875),
              OpenStruct.new(date: Date.parse("2023-12-06"), amount: 2.487572582416083017985026042072800965836639404296875),
              OpenStruct.new(date: Date.parse("2024-01-06"), amount: 2.487572582416083017985026042072800965836639404296875),
              OpenStruct.new(date: Date.parse("2024-02-06"), amount: 2.487572582416083017985026042072800965836639404296875),
              OpenStruct.new(date: Date.parse("2024-03-06"), amount: 2.487572582416083017985026042072800965836639404296875),
              OpenStruct.new(date: Date.parse("2024-04-06"), amount: 2.549761896976485093434651693124620989982555389404296875),
              OpenStruct.new(date: Date.parse("2024-05-06"), amount: 2.549761896976485093434651693124620989982555389404296875),
              OpenStruct.new(date: Date.parse("2024-06-06"), amount: 2.549761896976485093434651693124620989982555389404296875),
              OpenStruct.new(date: Date.parse("2024-07-06"), amount: 2.549761896976485093434651693124620989982555389404296875),
              OpenStruct.new(date: Date.parse("2024-08-06"), amount: 2.549761896976485093434651693124620989982555389404296875),
              OpenStruct.new(date: Date.parse("2024-09-06"), amount: 2.549761896976485093434651693124620989982555389404296875),
              OpenStruct.new(date: Date.parse("2024-10-06"), amount: 2.549761896976485093434651693124620989982555389404296875),
              OpenStruct.new(date: Date.parse("2024-11-06"), amount: 2.549761896976485093434651693124620989982555389404296875),
              OpenStruct.new(date: Date.parse("2024-12-06"), amount: 2.549761896976485093434651693124620989982555389404296875),
              OpenStruct.new(date: Date.parse("2025-01-06"), amount: 2.549761896976485093434651693124620989982555389404296875),
              OpenStruct.new(date: Date.parse("2025-02-06"), amount: 2.549761896976485093434651693124620989982555389404296875),
              OpenStruct.new(date: Date.parse("2025-03-06"), amount: 2.549761896976485093434651693124620989982555389404296875)
            ]
          end

          it "calculates the XIRR based on the cash flow items" do
            expect(described_class.calculate(cash_flow_items).round(10)).to eq 0.1672587233
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
