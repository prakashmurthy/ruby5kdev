require 'spec_helper'

describe User do
  describe "name= method" do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    it "should split the name into first_name and last_name" do
      @user.name = "Ashis Roy"
      @user.first_name.should eq( "Ashis" )
      @user.last_name.should eq( "Roy" )
    end

    it "should assign a single value to last_name" do
      @user.name = "Roy"
      @user.last_name.should eq( "Roy" )
      @user.first_name.should be_nil
    end

    it "should assign more than 2 parts to first_name" do
      @user.name = "Dr. Ashis Roy"
      @user.first_name.should eq( "Dr. Ashis" )
      @user.last_name.should eq( "Roy" )
    end
  end
end
