require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.first
  end

  test "renders new user template" do
    get new_user_path
    assert_response :success
  end

  test "does not allow empty username" do
    assert_no_difference 'User.count' do
      post users_path params: { user: { username: "" } }
      assert_not flash.empty?
    end
  end

  test "does post valid information" do
    assert_difference 'User.count', 1 do
      post users_path params: { user: { username: "Jackyl" } }
      assert_not flash.empty?
    end
  end

  test "should display user page" do
    get user_path(@user)

    assert_response :success
    assert_select "h1", "This is #{@user.username}'s page!"
  end
end
