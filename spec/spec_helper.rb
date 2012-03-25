require 'bundler/setup'

Bundler.require :default, :development, :test

require 'metrics-java'

# Pull in the support files
Dir[ Bundler.root.join("spec/support/**/*.rb") ].each{|f| require f}

RSpec.configure do |c|
  c.include CustomMatchers
end
