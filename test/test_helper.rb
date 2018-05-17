ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module SignInHelper
  def sign_in_as(user)
    post user_session_path(email: user.email, password: user.encrypted_password)
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include SignInHelper

  # Add more helper methods to be used by all tests here...
end
