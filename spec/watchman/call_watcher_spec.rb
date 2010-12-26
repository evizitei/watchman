require 'spec_helper'

include Watchman
describe "Watchman::CallWatcher" do
  before(:each) do
    Client.username = "some.name"
    Client.password = "1234"
    Client.host = "some.cad-host.com"
  end
  
  describe "when checking call list" do
    before(:each) do
      IstatusMocker.fake_call_table_path(Client.host)
    end
    
    it "can find a list of all current calls" do
      calls = ["201023861", "201023863", "201023876", "201023879", "201023883", "201023884", "201023885"]
      CallWatcher.new.current_call_incident_numbers.sort.should == calls.sort
    end
  end
  
  describe "when parsing a call" do
    before(:each) do
      IstatusMocker.fake_call_path(Client.host,"201023687")
    end
    
    let(:call){ CallWatcher.new.info_for("201023687") }
    
    it "can find the address" do
      call.address.should == "7750 HIGHWAY AB E"
    end
    
    it "can find the incident number" do
      call.incident_number.should == "201023687"
    end
    
    it "can find the cross-streets" do
      call.cross_streets.should == ["RANGELINE RD S","HIGHWAY 63 S SB"]
    end
    
    it "can extract the response level" do
      call.response_level.should == "Charlie"
    end
    
    it "can harvest the priority level" do
      call.priority.should == 2
    end
    
    it "extracts the dispatch_code" do
      call.dispatch_code.should == "BOX"
    end
  end
end