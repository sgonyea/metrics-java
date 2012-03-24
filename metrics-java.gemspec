# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "metrics-java/version"

Gem::Specification.new do |s|
  s.name        = "metrics-java"
  s.version     = MetricsJ::VERSION
  s.authors     = ["Scott Gonyea"]
  s.email       = ["sgonyea@truecar.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "metrics-java"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "slf4j"

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
