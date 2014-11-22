# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quora-webdriver/version'

Gem::Specification.new do |spec|
  spec.name          = "quora-webdriver"
  spec.version       = Watir::Browser::Quora::VERSION
  spec.authors       = ["Giordon Stark"]
  spec.email         = ["kratsg@gmail.com"]
  spec.summary       = %q{Interact with Quora via Command Line}
  spec.description   = %q{Interact with Quora via Command Line.}
  spec.homepage      = "https://github.com/kratsg/quora-webdriver"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "watir-webdriver", "~> 0.6"
  spec.add_dependency "watir-scroll", "~> 0.1"
  spec.add_dependency "highline", "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
end
