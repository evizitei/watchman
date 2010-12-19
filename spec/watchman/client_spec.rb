require 'spec_helper'

include Watchman
describe "Watchman::Client" do
  before(:each) do
    Client.username = "some.name"
    Client.password = "1234"
    Client.host = "some.cad-host.com"
    IstatusMocker.fake_medic_path(Client.host)
  end
  
  describe "authentication info" do
    it "can have auth info set" do
      Client.username.should == "some.name"
      Client.password.should == "1234"
      Client.host.should ==  "some.cad-host.com"
    end
  end
  
  describe "fetching the medic page" do
    it "can pull the medic apparatus page" do
      client = Client.new
      page = client.medic_page
      page.parser.to_s.should =~ /M131/
    end
  end
end