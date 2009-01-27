require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_create
    num_users = User.count
    User.new(:username => "", :password => "passw0rd").save
    assert_equal(num_users, User.count, "Created User with empty string for a username.")
	
    User.new(:username => "testUser", :password => "passw0rd").save
    assert_equal(num_users + 1, User.count)
    
    User.new(:username => "testUser", :password => "passw0rd").save
    assert_equal(num_users + 1, User.count, "Created User with a username already in use.")
  end
end
