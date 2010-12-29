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
  
  describe "when parsing an old call" do
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
    
    it "can get the grid" do
      call.grid.should == "34123B"
    end
    
    it "can get the fire_area" do
      call.fire_area.should == "19-17B"
    end
    
    it "gets the time of alarm" do
      call.time_of_alarm.should == Time.parse("12/19/2010 14:15:05")
    end
    
    it "gets the on-scene time" do
      call.time_of_first_unit_on_scene == Time.parse("12/19/2010 14:27:09")
    end
  end
  
  describe "when parsing an active call" do
    before(:each) do
      IstatusMocker.fake_active_call_path(Client.host,"201024340")
    end
    
    let(:call){ CallWatcher.new.info_for("201024340") }
    
    it "can find the address" do
      call.address.should == "HIGHWAY WW E-BC/RANGELINE RD S"
    end
    
    it "can find the incident number" do
      call.incident_number.should == "201024340"
    end
   
    it "can find the cross-streets" do
      call.cross_streets.should == ["RANGELINE RD S","BLACKTHORNE LN S"]
    end
   
    it "can extract the response level" do
      call.response_level.should == "Bravo"
    end
   
    it "can harvest the priority level" do
      call.priority.should == 1
    end
    
    it "extracts the dispatch_code" do
      call.dispatch_code.should == "IA"
    end
    
     it "can get the grid" do
       call.grid.should == "30194B"
     end
     
     it "can get the fire_area" do
       call.fire_area.should == "12-15C"
     end
     
     it "gets the time of alarm" do
       call.time_of_alarm.should == Time.parse("12/29/2010 14:54:53")
     end
     
     it "gets the on-scene time" do
       call.time_of_first_unit_on_scene == Time.parse("12/29/2010 15:04:18")
     end
  end
end