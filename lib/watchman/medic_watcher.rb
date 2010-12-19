module Watchman
  class MedicWatcher
    STATUSI = ["AVL","DSP","ENR","TRN","ARV","AV1","INC","OFF","ONS","ORP","ENH","ONH","AOS","OOD","OOS","AAS"]
    
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
      count(/TruckID=M(11|15|21|22|23)\d/,"AVL")
    end
    
    def county_status
      count(/TruckID=M(11|13|15|21|22|23|24)\d/,"AVL")
    end
    
    def status_of(medic)
      STATUSI.each do |status|
        return status if count(/TruckID=M#{medic}/,status) >= 1
      end
      "OOS"
    end
    
    private
    
    def cookie
      Mechanize::Cookie.new("TScreen","4")
    end
    
    def count(regex,status = "AVL")
      nodes = page.parser.css("a.#{status}")
      nodes = nodes.map{|node| node.attributes["href"].value}.select{|val| val =~ regex}
      nodes.size
    end
  end
end