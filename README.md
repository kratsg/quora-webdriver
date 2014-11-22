# Watir::Browser::Quora [![Build Status](https://travis-ci.org/kratsg/quora-webdriver.svg?branch=master)](https://travis-ci.org/kratsg/quora-webdriver) [![Gem Version](https://badge.fury.io/rb/quora-webdriver.svg)](http://badge.fury.io/rb/quora-webdriver)

Interact with Quora via Command Line! This is an extension of [watir-webdriver](https://github.com/watir/watir-webdriver) by providing `browser.quora` options operating on a browser. **Caveat**: seems to only work with the Chromedriver (see [#usage](#usage) below).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quora-webdriver'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quora-webdriver

## Usage

You can get started up and easily using the `chromedriver`
- https://sites.google.com/a/chromium.org/chromedriver/
- http://brewformulas.org/Chromedriver

```
require 'quora-webdriver'
b = Watir::Browser.new :chrome
b.quora.content :answers
```

## Reporting Issues
[File an issue.](https://github.com/kratsg/quora-webdriver/issues/new)

## Contributing
There are not a lot of features added yet. This is to get started and I welcome others to help flesh this out more. Contact [Giordon Stark](https://github.com/kratsg) with requests or on [Quora](https://www.quora.com/Giordon-Stark/).

1. Fork it ( https://github.com/kratsg/quora-webdriver/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. **Write your tests!**
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

### Issue

Pull requests from forks will most likely have builds that fail because of private keys being used for OpenSauce. Please commit with a message that includes `[skip ci]` and I'll checkout and push myself to see if the pull request passes build before merging. This message should tell Travis to skip the build. More information
- http://docs.travis-ci.com/user/pull-requests/
- https://github.com/travis-ci/travis-ci/issues/1946
