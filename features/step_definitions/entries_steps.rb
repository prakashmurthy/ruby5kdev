Given(/^there are the following entries:$/) do |table|
  table.hashes.each do |attributes|
    Entry.create!(attributes)
  end
end

Given(/^"(.*?)" has created the following entries:$/) do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(:user => User.find_by_email!(email))
    Entry.create!(attributes)
  end
end

Given(/^I "(.*?)" within the line containing "(.*?)"$/) do |action, entry_description|
  element = find("tr.row-#{entry_description.downcase.split.join("_")}")
  element.click_link(action)
end

Then(/^within line containing "(.*?)" I should not see "(.*?)"$/) do |entry_description, action|
  element = find("tr.row-#{entry_description.downcase.split.join("_")}")
  element.should_not have_content action
end
