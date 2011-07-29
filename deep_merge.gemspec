# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "deep_merge/version"

Gem::Specification.new do |s|
  s.name        = "deep_merge"
  s.version     = DeepMerge::VERSION
  s.authors     = ["Steve Midgley", "Dan DeLeo"]
  s.email       = ["dan@kallistec.com"]
  s.homepage    = "https://github.com/danielsdeleo/deep_merge"
  s.summary     = "Merge Deeply Nested Hashes"
  s.description = "Fork of deep_merge, with Ruby 1.9 and ActiveSupport Compatibility"

  s.rubyforge_project = "deep_merge"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
