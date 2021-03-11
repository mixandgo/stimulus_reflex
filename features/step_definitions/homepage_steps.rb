Given('I go to the homepage') do
  visit "/"
end

Then('I should not see the signout link') do
  expect(page).to_not have_css("#user-signout")
end

Then('I should see the signin and signup links') do
  expect(page).to have_css("#user-signin")
  expect(page).to have_css("#user-signup")
end

Then('I should not see the signin link') do
  expect(page).to_not have_css("#user-signin")
end

Then('I should not see the signup link') do
  expect(page).to_not have_css("#user-signup")
end
