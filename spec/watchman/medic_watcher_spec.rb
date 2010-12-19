require 'spec_helper'

include Watchman
describe "Watchman::MedicWatcher" do
  before(:each) do
    Client.username = "some.name"
    Client.password = "1234"
    Client.host = "some.cad-host.com"
    IstatusMocker.fake_medic_path(Client.host)
  end
  
  let(:watcher){ MedicWatcher.new}

  it "can pull the medic apparatus page" do
    watcher.raw_page.should =~ /M131/
  end

  it "can count the medic units in the city" do
    watcher.city_status.should == 4
  end

  it "counts the medic units in the county" do
    watcher.county_status.should == 6
  end
end