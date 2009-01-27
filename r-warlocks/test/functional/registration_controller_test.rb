require 'test_helper'

class RegistrationControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_new
    num_users = User.count

    post :new, :user => {:username => "testUser", :password => "passw0rd"}

    assert_response :redirect
    assert_redirected_to :controller => 'player', :action => 'list'

    assert_equal num_users + 1, User.count
  end
end
