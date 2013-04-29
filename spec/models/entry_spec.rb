require 'spec_helper'

describe Entry do

  it "is invalid without user" do
    entry = FactoryGirl.build(:entry)
    entry.user = nil
    entry.should_not be_valid
    entry.errors["user"].should include("can't be blank")
  end

  it "is invalid without distance and time" do
    entry = FactoryGirl.build(:entry)
    entry.time = nil
    entry.distance = nil
    entry.should_not be_valid
    entry.errors["distance"].should include("You must enter distance or time or both.")
  end

  it "is valid with only distance" do
    entry = FactoryGirl.build(:entry)
    entry.time = nil
    entry.should be_valid
  end

  it "is valid with only time" do
    entry = FactoryGirl.build(:entry)
    entry.distance = nil
    entry.should be_valid
  end

end
