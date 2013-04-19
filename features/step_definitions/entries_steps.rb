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
