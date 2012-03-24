#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'rspec'
require 'rspec/core'
require 'rspec/core/rake_task'

desc "Run Specs"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern    = "spec/**/*_spec.rb"
  spec.verbose    = true
  spec.rspec_opts = ['--color']
end

task :consumer_email => :build do
  require 'exact_target/version'

  `cp pkg/exact_target-#{ExactTarget::VERSION}.gem ../consumer_email/vendor/cache/`
end
