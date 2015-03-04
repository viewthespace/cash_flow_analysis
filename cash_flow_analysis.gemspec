# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cash_flow_analysis/version"

Gem::Specification.new do |spec|
  spec.name          = "cash_flow_analysis"
  spec.version       = CashFlowAnalysis::VERSION
  spec.authors       = ["Hightower"]
  spec.email         = ["engineering@gethightower.com"]

  spec.summary       = %q{Ruby implementation of various financial analysis functions.}
  spec.homepage      = "https://github.com/hightower/cash_flow_analysis"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
