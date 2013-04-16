# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    distance 1.5
    time 1
    location "MyString"
    description "MyText"
  end
end
