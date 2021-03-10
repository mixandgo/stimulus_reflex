Given("I'm logged in") do
  sign_up
  sign_out
  sign_in
  expect(page).to have_content("Welcome mixandgo")
end

When('I create a new post') do
  create_post
end

Then('I should see my post on the timeline') do
  expect(page).to have_content("My post body")
  expect(page).to have_css("img[src*='image.jpg']")
end

Given('I open a second browser window') do
  Capybara.using_session("browser2") do
    sign_up(email: "jdoe2@example.com")
  end
end

Then('I can see the post in the second window without reload') do
  Capybara.using_session("browser2") do
    expect(page).to have_content("My post body")
  end
end

Given("I've created a new post") do
  sign_up
  create_post
end

When('I like the post') do
  like_post
end

Then('the like icon should be enabled') do
  expect(page).to have_css("img[src*='liked-']")
end

Then('I the number of likes should change') do
  expect(page).to have_content("1 like")
end

Given("I've liked my post") do
  sign_up
  create_post
  like_post
end

When("someone else likes my post") do
  Capybara.using_session("browser2") do
    sign_up(email: "jdoe2@example.com")
    like_post
  end
end

Then("I should see the number of likes increase without reloading the page") do
  expect(page).to have_content("2 likes")
end
