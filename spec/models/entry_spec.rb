require 'spec_helper'

describe Entry do
  it "should have a user" do
    entry = FactoryGirl.create( :entry)
    entry.user = nil
    entry.should_not be_valid
    entry.errors["user"].should include("can't be blank")
  end
end
