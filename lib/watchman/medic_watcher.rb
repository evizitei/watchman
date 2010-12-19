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
    
    def city_status
      count_available(/TruckID=M(11|15|21|22|23)\d/)
    end
    
    private
    
    def cookie
      Mechanize::Cookie.new("TScreen","4")
    end
    
    def count_available(regex)
      nodes = page.parser.css("a.AVL")
      nodes = nodes.map{|node| node.attributes["href"].value}.select{|val| val =~ regex}
      nodes.size
    end
  end
end