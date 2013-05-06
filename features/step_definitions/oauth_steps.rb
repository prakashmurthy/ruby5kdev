Given /^we are mocking a successful Twitter response$/ do
  OmniAuth.config.mock_auth[:twitter] = {
    "extra" => {
      "raw_info" => {
        "id" => '12345',
        "screen_name" => "jack",
        "name" => "Jack Dorsey"
      }
    }
  }
end

Given /^I have mocked a successful GitHub response$/ do
  OmniAuth.config.mock_auth[:github] = {
    "extra" => {
      "raw_info" => {
        "id" => '12345',
        "email" => "phil@haack.com",
        "login" => "philhaack",
        "name"  => "Phil Haack"
      }
    }
  }
end
