require 'mechanize'

module Watchman
  class Client
    class << self
      attr_accessor :username,:password,:host
    end
    
    def medic_page
      if @_medic_page.nil?
        add_medic_page_cookie(agent)
        @_medic_page = get("AjaxTS2.php")
      end
      @_medic_page
    end
    
  private
    def get(path)
      agent.get("https://#{Client.host}/#{path}")
    end
  
    def agent
      if @_agent.nil?
        @_agent = Mechanize.new
        page = @_agent.get("http://#{Client.host}/")
        form = page.form("UserForm")
        form.UserName = Client.username
        form.Password = Client.password
        @_agent.submit(form, form.buttons.first)
      end
      @_agent
    end
    
    def add_medic_page_cookie(agent)
      cookie = Mechanize::Cookie.new("TScreen","4")
      cookie.secure = false
      cookie.domain = Client.host
      if agent.cookie_jar.jar[Client.host].nil?
        agent.cookie_jar.jar[Client.host] = {"/"=>{"TScreen"=>cookie}}
      else
        agent.cookie_jar.jar[Client.host]["/"]["TScreen"] = cookie
      end
    end
  end
end