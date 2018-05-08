# Run Coverage report
require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)

require 'rspec/rails'
require 'database_cleaner'
require 'ffaker'
require 'factory_bot'
require 'rails-controller-testing'
# Requires factories and other useful helpers defined in spree_core.
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/capybara_ext'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/factories'
require 'spree/testing_support/url_helpers'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
  config.raise_errors_for_deprecations!


  config.include Spree::TestingSupport::UrlHelpers
  config.include Spree::TestingSupport::ControllerRequests, type: :controller

  config.mock_with :rspec do |mock|
    mock.syntax = [:should, :expect]
  end
  config.color = true

  config.fail_fast = ENV['FAIL_FAST'] || false
  config.order = "random"
end
