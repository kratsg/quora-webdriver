require 'rspec'
require 'quora-webdriver'

if ENV['TRAVIS']
  puts "TRAVIS testing..."
  username = ENV["SAUCE_USERNAME"]
  access_key = ENV["SAUCE_ACCESS_KEY"]

  browser, version, os = ENV['BROWSER'].split(':')

  # set up browser
  capabilities = Selenium::WebDriver::Remote::Capabilities.send(browser)
  # add version and os
  capabilities["version"] = version
  capabilities["platform"] = os

  # help identify a job
  capabilities["tunnel-identifier"] = ENV["TRAVIS_JOB_NUMBER"]
  # and add extra details
  capabilities["name"] = "Travis ##{ENV['TRAVIS_JOB_NUMBER']}"
  capabilities["build"] = ENV["TRAVIS_BUILD_NUMBER"]
  capabilities["tags"] = [ENV["TRAVIS_RUBY_VERSION"], "CI"]

  hub_url = "http://#{username}:#{access_key}@localhost:4445/wd/hub"
  browser_params = [
    :remote,
    :url => hub_url,
    :desired_capabilities => capabilities]
else
  browser_params = [:chrome]
end

$browser_params = browser_params
