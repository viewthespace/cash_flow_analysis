# CashFlowAnalysis

[![Build Status](https://travis-ci.org/hightower/cash_flow_analysis.svg?branch=master)](https://travis-ci.org/hightower/cash_flow_analysis)

Ruby implementation of various financial analysis functions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "cash_flow_analysis"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cash_flow_analysis

## Usage

The gem provides four calculators, CAGR, Payment, XIRR, and XNPV.

### CAGR

Calculates the [CAGR](http://en.wikipedia.org/wiki/Compound_annual_growth_rate) based on a start value, end value, and a term.

```
CashFlowAnalysis::Calculator::Cagr.calculate(25.5, 35.5, 5)
# 0.06840923807777366
```

### Payment

Calculates the [payment for a loan](http://en.wikipedia.org/wiki/Mortgage_calculator), assuming fixed payments and rates.

```
CashFlowAnalysis::Calculator::Payment.calculate(10000, 60, 0.025)
# 323.5339590005929
```

### XNPV

Calculates the [XNPV](http://en.wikipedia.org/wiki/Net_present_value), assuming irregularly timed cash flows.

```
items = []
items << OpenStruct.new(date: Date.new(2008, 1, 1), amount: -10000)
items << OpenStruct.new(date: Date.new(2008, 3, 1), amount: 2750)
items << OpenStruct.new(date: Date.new(2008, 10, 30), amount: 4250)
items << OpenStruct.new(date: Date.new(2009, 2, 15), amount: 3250)
items << OpenStruct.new(date: Date.new(2009, 4, 1), amount: 2750)
CashFlowAnalysis::Calculator::Xnpv.calculate(0.09, items)
# 2086.647602031535
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cash_flow_analysis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
