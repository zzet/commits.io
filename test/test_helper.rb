require 'simplecov'

SimpleCov.start('rails') if ENV["COVERAGE"]

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
Dir[File.expand_path('../support/**/*.rb', __FILE__)].each {|f| require f}
Dir[File.expand_path('../lib/**/*.rb', __FILE__)].each {|f| require f}
require 'mocha/setup'
require 'webmock/minitest'

class ActiveSupport::TestCase
  include AuthHelper
  include SecureHelper
  include SocNetworkHelper
  include TestSupport

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  require 'factory_girl'
  require 'factory_girl_sequences'
  FactoryGirl.reload
  FactoryGirlSequences.reload

  include FactoryGirl::Syntax::Methods
end

