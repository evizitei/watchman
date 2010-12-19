module Watchman
  class Client
    class << self
      attr_accessor :username,:password,:host
    end
    
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
    
    def add_cookie(cookie,key)
      cookie.secure = false
      cookie.domain = Client.host
      if agent.cookie_jar.jar[Client.host].nil?
        agent.cookie_jar.jar[Client.host] = {"/"=>{key=>cookie}}
      else
        agent.cookie_jar.jar[Client.host]["/"][key] = cookie
      end
    end
  end
end