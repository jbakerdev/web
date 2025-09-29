# frozen_string_literal: true

require "application_system_test_case"

class AuthenticationTest < ApplicationSystemTestCase
  test "user can sign in and sign out" do
    user = users(:jbakerdev)

    # Test sign in
    visit new_session_path
    sign_in_as user

    # Verify successful sign in
    assert_current_path root_path
    assert_text "Welcome back, User"

    # Test sign out
    click_button "Sign out"

    # Verify successful sign out
    assert_current_path new_session_path
    assert_text "Authenticate yourself, User"
  end

  test "user cannot sign in with invalid credentials" do
    user = users(:jbakerdev)

    # Test sign in
    visit new_session_path
    sign_in_as user, password: "incorrect_password"

    # Verify sign in failed
    assert_current_path new_session_path
    assert_text "Access denied"
  end
end
