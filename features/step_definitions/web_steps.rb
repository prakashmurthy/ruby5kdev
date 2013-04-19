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

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_content text
end
