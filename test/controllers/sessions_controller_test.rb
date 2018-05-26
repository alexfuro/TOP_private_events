require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:dave)
  end

  test "should get new" do
    get new_session_path
    assert_response :success
  end

  test "should get create" do
    post sessions_path params: { sessions: { username: @user.username }}
    assert_not session[:id].nil?
    assert_redirected_to user_path(@user)
  end

  test "should get destroy" do
    delete session_path(@user.id)
    assert session[:id].nil?
  end

end
