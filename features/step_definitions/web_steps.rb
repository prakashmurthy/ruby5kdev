Given /^I am on the homepage$/ do
  visit "/"
end

When /^(?:|I )fill in password with "([^"]*)"$/ do |value|
  page.find("#user_password").set "#{value}"
end

When /^(?:|I )fill in password confirmation with "([^"]*)"$/ do |value|
  page.find("#user_password_confirmation").set "#{value}"
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |element, text|
  fill_in element, with: text
end

Given(/^I (?:press|follow) "(.*?)"$/) do |element|
  click_on element
end

# Special case step to handle duplicate "New Training Session" links in the entry#index page
Given(/^I click on "(.*?)"$/) do |element|
  first(:link, element).click
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_content text
end

Then(/^"(.*?)" should appear before "(.*?)"$/) do |text1, text2|
  page.body.should =~ /#{text1}.*#{text2}/m #, "'#{text1}' does not appear before '#{text2}'"
end

When(/^I choose "(.*?)" for "(.*?)" radio button$/) do |option, check_box_name|
  page.choose("user_#{check_box_name}_#{option}")
end

When /^I check "(.*?)"$/ do |field|
  check(field)
end
