$:.unshift File.join(__dir__, '..')

require 'require_all'
require 'test/unit'
require_rel 'tests/*_test.rb'
require_rel '*.rb'



