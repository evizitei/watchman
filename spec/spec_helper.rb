require "rubygems"
require "bundler/setup"
require 'watchman'
require 'fakeweb'

FakeWeb.allow_net_connect = false

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir['./spec/support/**/*.rb'].map {|f| require f}