# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{deep_merge}
  s.version = "1.0.0"

  s.authors = ["Steve Midgley"]
  s.date = %q{2011-07-28}
  s.description = %q{Recursively merge hashes. Now works with Ruby 1.9 and ActiveSupport}
  s.email = %q{dan@kallistec.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "CHANGELOG",
    "README",
    "Rakefile",
    "VERSION",
    "lib/deep_merge.rb",
    "lib/deep_merge/core.rb",
    "lib/deep_merge/deep_merge_hash.rb",
    "lib/deep_merge/rails_compat.rb",
    "test/test_deep_merge.rb"
  ]
  s.homepage = %q{http://github.com/danielsdeleo/deep_merge}
  s.require_paths = ["lib"]
  s.summary = %q{Merge Deeply Nested Hashes}
  s.test_files = [
    "test/test_deep_merge.rb"
  ]

end

