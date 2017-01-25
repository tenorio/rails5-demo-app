ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/spec'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def autenticar
    bill = users(:bill)
    post sessions_url, params: { email: bill.email, password: 'bill123456' }
  end

  extend MiniTest::Spec::DSL

  # tell MiniTest::Spec to use ActiveSupport::TestCase when describing an ActiveRecord model.
  register_spec_type self do |desc|
    desc < ActiveRecord::Base if desc.is_a? Class
  end
end
