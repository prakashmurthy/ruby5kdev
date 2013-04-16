After do |scenario|
  save_and_open_page if scenario.failed? && (ENV["debug"] == "open")
  pp(page) if scenario.failed? && ENV["debug"] == "pp"
end
