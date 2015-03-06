require "bundler/gem_tasks"
require "rspec/core/rake_task"

desc "Run all specs in spec/"
task :spec do
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.fail_on_error = true
    t.pattern = "./spec/**/*_spec.rb"
    t.rspec_opts = %w[--color]
  end
end

task default: [:spec]
