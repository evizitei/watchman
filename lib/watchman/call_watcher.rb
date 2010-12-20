module Watchman
  class CallWatcher
    
    def initialize
      @client = Client.new
    end
    
    def info_for(incident_number)
      call = Call.new(@client.get("DisplayCall.php?Incid=#{incident_number}"))
      if call.notes.size == 0
        call = Call.new(@client.get("DisplayFireCall.php?Incid=#{incident_number}"))
      end
      call
    end
  end
end