require 'bundler/gem_tasks'

desc "Open development console"
task :console do
  puts "Loading development console..."
  system "irb -I #{File.join('.', 'lib')} -r #{File.join('.', 'lib', 'deep_merge')}"
end
