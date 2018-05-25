require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user_one = users(:dave)
    @user_two = users(:sally)
  end

  test  "should not have a blank username" do
    @user_one.username = "  "
    assert_not @user_one.valid?
  end

  test "should have a valid username" do
    assert @user_one.valid?
  end

  test "should not allow duplicate usernames" do
    @user_two.username = @user_one.username
    assert_not @user_two.valid?
  end
end
