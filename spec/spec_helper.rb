# frozen_string_literal: true

require 'simplecov'
SimpleCov.start
SimpleCov.minimum_coverage 95
require 'bundler/setup'
require 'codebreaker'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
