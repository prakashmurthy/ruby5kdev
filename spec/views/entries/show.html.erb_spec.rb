require 'spec_helper'

describe "entries/show" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :distance => 1.5,
      :time => 1,
      :location => "Location",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/1/)
    rendered.should match(/Location/)
    rendered.should match(/MyText/)
  end
end
