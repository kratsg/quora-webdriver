require 'spec_helper'

browser = $browser

quora_main_page = "https://www.quora.com/"

RSpec.configure do |config|
  config.before(:all) { @browser = Watir::Browser.new(*$browser_params) }
  config.after(:all) { @browser.close unless @browser.nil? }
end

describe "a quora login page" do
  before(:all) do
    @browser.goto(quora_main_page)
  end

  describe "that we should have opened it" do
    it "should not return an empty page" do
      expect(@browser.text).not_to be_empty
    end
    it "should have login text" do
      expect(@browser.text).to include("LOGIN\nRemember Me\nForgot Password?")
    end

  end

end
