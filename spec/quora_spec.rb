require 'rspec'
require 'quora-webdriver'

browser = Watir::Browser.new :phantomjs
quora_login_html = "file://#{File.expand_path("quora_login.html",File.dirname(__FILE__))}"

RSpec.configure do |config|
  config.before(:each) { @browser = browser }
  config.after(:suite) { @browser.close unless @browser.nil? }
end

describe "a quora login page" do
  before(:each) do
    @browser.goto(quora_login_html)
  end

  describe "that we should have opened it" do
    it "should not return an empty page" do
      expect(@browser.text).not_to be_empty
    end
    it "should have found the local html file" do
      expect(@browser.text).not_to include("This webpage is not found")
    end
    it "should have loaded the html file" do
      expect(@browser.text).to include("Sign up to read Quora")
    end

  end

end
