module Watchman
  class MedicWatcher
    def initialize
      @client = Client.new
    end
    
    def raw_page
      page.parser.to_s
    end
    
    def page
      if @_medic_page.nil?
        @client.add_cookie(cookie,"TScreen")
        @_medic_page = @client.get("AjaxTS2.php")
      end
      @_medic_page
    end
    
    private
    
    def cookie
      Mechanize::Cookie.new("TScreen","4")
    end
  end
end