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
    
    def current_call_incident_numbers
      page = @client.get("AjaxDC2.php")
      page.parser.to_s.scan(/DisplayCall\.php\?Incid\=(\d+)/).flatten
    end
  end
end