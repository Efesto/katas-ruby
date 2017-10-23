require 'rake/testtask'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

Rake::TestTask.new do |task|
  task.test_files = FileList['**/*_test.rb']
  .reject do |path|
    path.include?('vendor')
  end
  task.verbose = true
end

RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = '*/*_spec.rb'
end

task default: [:test, :spec]
