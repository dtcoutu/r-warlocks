require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_create
    num_users = User.count
    User.new(:userid => "", :password => "passw0rd").save
    assert_equal(num_users, User.count, "Created User with empty string for a userid.")
	
    User.new(:userid => "testUser", :password => "passw0rd").save
    assert_equal(num_users + 1, User.count)
    
    User.new(:userid => "testUser", :password => "passw0rd").save
    assert_equal(num_users + 1, User.count, "Created User with a userid already in use.")
  end
end
