require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << FileList['lib/**.rb']
  t.test_files = FileList['test/test*.rb']
end

begin
  require 'rubygems'
  require 'rubygems/package_task'

  gemspec = eval(IO.read('deep_merge.gemspec'))
  Gem::PackageTask.new(gemspec).define
rescue LoadError
  #okay, then
end

