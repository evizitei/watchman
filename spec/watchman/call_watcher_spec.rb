require 'spec_helper'

include Watchman
describe "Watchman::CallWatcher" do
  before(:each) do
    Client.username = "some.name"
    Client.password = "1234"
    Client.host = "some.cad-host.com"
    IstatusMocker.fake_call_path(Client.host,"201023687")
  end
  
  it "can find the address" do
    call = CallWatcher.new.info_for("201023687")
    call.address.should == "7750 HIGHWAY AB E"
    call.incident_number.should == "201023687"
  end
end