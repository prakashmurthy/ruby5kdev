Given(/^there are the following entries:$/) do |table|
  table.hashes.each do |attributes|
    Entry.create!(attributes)
  end
end
