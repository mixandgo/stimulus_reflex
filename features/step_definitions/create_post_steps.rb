Given("I'm logged in") do
  # visit /
  # create account
  # sign out
  # click login link
  # fill in the login form
  # submit the form
  # should see message
  visit "/"
  expect(page).to have_content("Welcome")
end

When('I create a new post') do
  click_on "post-new"
  fill_in "post-body", with: "My post body"
  attach_file "post-file", "#{Rails.root}/features/support/fixtures/image.jpg"
  click_on "post-new-submit"
end

Then('I should see my post on the timeline') do
  expect(page).to have_content("My post body")
  expect(page).to have_css("img[src*='image.jpg']")
end
