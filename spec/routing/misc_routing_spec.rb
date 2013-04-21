require "spec_helper"

describe MiscController do
  describe "routing" do

    it "routes to #contact_us" do
      get("/contact_us").should route_to("misc#contact_us")
    end
  end
end
