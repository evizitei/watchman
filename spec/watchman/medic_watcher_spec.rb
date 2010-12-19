require 'spec_helper'

include Watchman
describe "Watchman::MedicWatcher" do
  before(:each) do
    Client.username = "some.name"
    Client.password = "1234"
    Client.host = "some.cad-host.com"
    IstatusMocker.fake_medic_path(Client.host)
  end
  
  describe "fetching the medic page" do
    it "can pull the medic apparatus page" do
      watcher = MedicWatcher.new
      watcher.raw_page.should =~ /M131/
    end
  end
end