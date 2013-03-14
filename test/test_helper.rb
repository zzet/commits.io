require 'simplecov'
require 'webmock/minitest'

SimpleCov.start('rails') if ENV["COVERAGE"]

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

Dir[Rails.root.join("test/lib/*.rb")].each {|f| require f}

class ActiveSupport::TestCase
  include AuthHelper
  include SecureHelper
  include SocNetworkHelper

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  require 'factory_girl'
  FactoryGirl.reload

  include FactoryGirl::Syntax::Methods
end
