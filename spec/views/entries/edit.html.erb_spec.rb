require 'spec_helper'

describe "entries/edit" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :distance => 1.5,
      :time => 1,
      :location => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => entries_path(@entry), :method => "post" do
      assert_select "input#entry_distance", :name => "entry[distance]"
      assert_select "input#entry_time", :name => "entry[time]"
      assert_select "input#entry_location", :name => "entry[location]"
      assert_select "textarea#entry_description", :name => "entry[description]"
    end
  end
end
