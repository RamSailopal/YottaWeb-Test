require 'socket'
require 'mg_ruby'
server = TCPServer.new 8000
session = server.accept

while true
      request = session.gets.chomp;
            mg_ruby = MG_RUBY.new()
            mg_ruby.m_set_host('localhost', 7042, '', '')
            key = ""
            while ((key = mg_ruby.m_order("^PATIENTS", key)) != "")
               id = key
               name = mg_ruby.m_get("^PATIENTS", id, "name")
               address = mg_ruby.m_get("^PATIENTS", id, "address")
               age =  mg_ruby.m_get("^PATIENTS", id, "age")
               sex = mg_ruby.m_get("^PATIENTS", id, "sex")
               puts "\{\"id\":\"#{id}\", \"name\":\"#{name}\", \"address\":\"#{address}\", \"sex\":\"#{sex}\"\}"
               session.puts "\{\"id\":\"#{id}\", \"name\":\"#{name}\", \"address\":\"#{address}\", \"sex\":\"#{sex}\"\}" 
            end
end

session.close

