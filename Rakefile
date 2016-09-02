require 'rake/testtask'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

Rake::TestTask.new do |task|
  task.test_files = FileList['**/*_test.rb']
  task.verbose = true
end

RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = '*/*_spec.rb'
end


task :rubocop do
  sh "rubocop --except 'Metrics/LineLength' --except 'Style/FrozenStringLiteralComment'"
end

task default: [:test, :spec]
