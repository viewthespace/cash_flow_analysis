require "spec_helper"

module CashFlowAnalysis
  module Calculator
    describe Xnpv do
      describe ".calculate" do
        describe "scenario 1" do
          let(:discount_rate) { 0.09 }
          let(:cash_flow_items) do
            [
              double(:cash_flow_item1, date: Date.new(2008, 1, 1), amount: -10000),
              double(:cash_flow_item2, date: Date.new(2008, 3, 1), amount: 2750),
              double(:cash_flow_item3, date: Date.new(2008, 10, 30), amount: 4250),
              double(:cash_flow_item4, date: Date.new(2009, 2, 15), amount: 3250),
              double(:cash_flow_item5, date: Date.new(2009, 4, 1), amount: 2750)
            ]
          end

          it "calculates the XNPV based on the specified discount rate and cash flow items" do
            expect(described_class.calculate(discount_rate, cash_flow_items).round(10)).to eq 2086.6476020315
          end
        end

        describe "scenario 2" do
          let(:discount_rate) { 0.08 }
          let(:cash_flow_items) do
            [
              double(:cash_flow_item1, date: Date.new(2008, 1, 1), amount: -10000),
              double(:cash_flow_item2, date: Date.new(2008, 3, 1), amount: 2750),
              double(:cash_flow_item3, date: Date.new(2008, 10, 30), amount: 4250),
              double(:cash_flow_item4, date: Date.new(2009, 2, 15), amount: 3250),
              double(:cash_flow_item5, date: Date.new(2009, 4, 1), amount: 2750)
            ]
          end

          it "calculates the XNPV based on the specified discount rate and cash flow items" do
            expect(described_class.calculate(discount_rate, cash_flow_items).round(10)).to eq 2180.5132770139
          end
        end

        describe "scenario 3" do
          let(:discount_rate) { 0.05 }
          let(:cash_flow_items) do
            [
              double(:cash_flow_item1, date: Date.new(2008, 1, 1), amount: -10000),
              double(:cash_flow_item2, date: Date.new(2008, 1, 2), amount: 250),
              double(:cash_flow_item3, date: Date.new(2008, 10, 30), amount: 4250),
              double(:cash_flow_item4, date: Date.new(2009, 2, 15), amount: 3250),
              double(:cash_flow_item5, date: Date.new(2014, 4, 1), amount: 25),
              double(:cash_flow_item6, date: Date.new(2015, 4, 1), amount: 25),
              double(:cash_flow_item7, date: Date.new(2016, 4, 1), amount: 25),
              double(:cash_flow_item8, date: Date.new(2017, 4, 1), amount: 2500)
            ]
          end

          it "calculates the XNPV based on the specified discount rate and cash flow items" do
            expect(described_class.calculate(discount_rate, cash_flow_items).round(10)).to eq -948.1636695466
          end
        end
      end
    end
  end
end
