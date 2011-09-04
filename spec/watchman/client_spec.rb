require 'spec_helper'
require 'ruby-debug'

include Watchman
describe "Watchman::Client" do
  before(:each) do
    Client.username = "some.name"
    Client.password = "1234"
    Client.host = "some.cad-host.com"
  end
  
  describe "authentication info" do
    it "can have auth info set" do
      Client.username.should == "some.name"
      Client.password.should == "1234"
      Client.host.should ==  "some.cad-host.com"
    end
  end
end