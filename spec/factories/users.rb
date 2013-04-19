# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@ruby5k.com" }
    password "password"
    password_confirmation { |x| x.password }
  end
end
