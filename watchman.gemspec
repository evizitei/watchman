# -*- encoding: utf-8 -*-
require File.expand_path("../lib/watchman/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "watchman"
  s.version     = Watchman::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ethan Vizitei"]
  s.email       = ["ethan.vizitei@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/watchman"
  s.summary     = "monitor your CAD"
  s.description = "works for our web-view on the CAD produced by enroute.  your mileage may vary."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "watchman"

  s.add_dependency "mechanize"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.6"
  s.add_development_dependency "rspec", ">= 2.3.0"
  s.add_development_dependency "rake"
  s.add_development_dependency "fakeweb"
  s.add_development_dependency "ruby-debug19"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
