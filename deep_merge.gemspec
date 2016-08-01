# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{deep_merge}
  s.version = "1.1.1"

  s.authors = ["Steve Midgley"]
  s.date = %q{2016-08-01}
  s.description = %q{Recursively merge hashes.}
  s.email = %q{dan@kallistec.com}
  s.license = 'MIT'
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "CHANGELOG",
    "README.md",
    "Rakefile",
    "lib/deep_merge.rb",
    "lib/deep_merge/core.rb",
    "lib/deep_merge/deep_merge_hash.rb",
    "lib/deep_merge/rails_compat.rb",
    "test/test_deep_merge.rb"
  ]
  s.homepage = %q{https://github.com/danielsdeleo/deep_merge}
  s.require_paths = ["lib"]
  s.summary = %q{Merge Deeply Nested Hashes}
  s.test_files = [
    "test/test_deep_merge.rb"
  ]

  s.add_development_dependency "rake", "~> 10.1"
  s.add_development_dependency "test-unit-minitest"

end

