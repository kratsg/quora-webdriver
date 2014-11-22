require 'spec_helper'

browser = $browser

RSpec.configure do |config|
  config.before(:all) { @browser = Watir::Browser.new(*$browser_params) }
  config.after(:all) { @browser.close unless @browser.nil? }
end

context "when quora.com is accessed" do
  before(:all) do
    @browser.goto @browser.quora.base_url
  end

  context "the text" do
    subject { @browser.text }
    it { is_expected.not_to be_empty }
    it { is_expected.to include("Sign up to read Quora") }
  end

  context "add question div" do
    subject { @browser.quora.get_add_question_div }
    it { is_expected.not_to exist }
  end
  
  context "login box" do
    subject { @browser.quora.get_login_email_text }
    it { is_expected.to exist }

    subject { @browser.quora.get_login_password_text }
    it { is_expected.to exist }

    subject { @browser.quora.get_login_submit_button }
    it { is_expected.to exist }
  end

end
