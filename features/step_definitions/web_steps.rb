Given /^I am on the homepage$/ do
  visit "/"
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |element, text|
  fill_in element, with: text
end

Given(/^I press "(.*?)"$/) do |element|
  click_on element
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end
