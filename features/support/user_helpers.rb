def sign_up(email: "jdoe@example.com")
  visit "/"
  click_on "user-signup"
  fill_in "user-email", with: email
  fill_in "user-username", with: "mixandgo"
  fill_in "user-password", with: "secreT123"
  fill_in "user-password-confirmation", with: "secreT123"
  click_on "user-signup-submit"
end

def sign_out
  click_on "user-signout"
end

def sign_in
  visit "/"
  click_on "user-signin"
  fill_in "user-email", with: "jdoe@example.com"
  fill_in "user-password", with: "secreT123"
  click_on "user-signin-submit"
end
