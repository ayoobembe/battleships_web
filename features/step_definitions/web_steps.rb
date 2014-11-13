
Given(/^I am on the homepage$/) do
  visit('/')
end

When(/^I follow "(.*?)"$/) do |arg1|
  click_link('New Game')
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content("What's your name?")
end

When(/^I input my name and click "(.*?)"$/) do |arg1|
  fill_in('name', :with=>'Ayo')
  click_button('submit')
end

Then(/^I should see a page that welcomes me to Battleships$/) do
  expect(page).to have_content('Welcome to Battleships Ayo')
end
