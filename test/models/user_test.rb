require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:valid)
    @user.password = "bogus"
  end

  # Validations

  test "valid user" do
    assert @user.valid?
  end

  test "invalid without email" do
    @user.email = nil
    assert_not @user.valid?, "saved user without an email"
    assert_not_nil @user.errors[:email], "no validation errors for email present"
  end

  test "invalid without formatted email" do
    @user.email = "bob"
    assert_not @user.valid?, "saved user without a formatted email"
    assert_not_nil @user.errors[:email], "no validation errors for email present"
  end

  test "invalid without password" do
    @user.password = nil
    assert_not @user.valid?, "saved user without a password"
    assert_not_nil @user.errors[:password], "no validation errors for password present"
  end

  # Callbacks

  test "email formatted correctly" do
    @noob_user = users(:noob)
    @noob_user.password = "bogus"
    @noob_user.save!

    assert_equal @noob_user.email, @user.email, "saved user without formatting email"
  end
end
