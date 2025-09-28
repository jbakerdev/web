# frozen_string_literal: true

module SystemTestHelper
  def sign_in_as(user, password: "password")
    visit new_session_path
    fill_in :email_address, with: user.email_address
    fill_in :password, with: password
    click_button "Sign in"
  end

  def sign_out
    click_button "Sign out"
  end
end
