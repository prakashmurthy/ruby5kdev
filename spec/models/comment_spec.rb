require 'spec_helper'

describe Comment do
  it "is invalid without text" do
    comment = FactoryGirl.build(:comment)
    comment.text = nil
    comment.should_not be_valid
    comment.errors["text"].should include("can't be blank")
  end
end
