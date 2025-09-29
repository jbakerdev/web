require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:jbakerdev)
  end

  # Validations

  test "valid user" do
    assert @user.valid?
  end

  test "invalid without email address" do
    @user.email_address = nil
    assert_not @user.valid?, "saved user without an email address"
    assert_not_nil @user.errors[:email], "no validation errors for email present"
  end

  test "invalid without password" do
    @user.password = nil
    assert_not @user.valid?, "saved user without a password"
    assert_not_nil @user.errors[:password], "no validation errors for password present"
  end

  # Normalization

  test "normalize email address" do
    uppercase = "BOGUS@JBAKER.DEV"
    @user.email_address = uppercase

    assert @user.email_address, uppercase.downcase
  end
end
