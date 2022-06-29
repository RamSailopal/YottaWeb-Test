require 'ramaze'
require 'mg_ruby'

class MyController < Ramaze::Controller
    map '/api/patients'

      def index
            mg_ruby = MG_RUBY.new()
            mg_ruby.m_set_host('localhost', 7042, '', '')
            key = ""
            while ((key = mg_ruby.m_order("^PATIENTS", key)) != "")
              id = key
              name = mg_ruby.m_get("^PATIENTS", id, "name")
              address = mg_ruby.m_get("^PATIENTS", id, "address")
              age =  mg_ruby.m_get("^PATIENTS", id, "age")
              sex = mg_ruby.m_get("^PATIENTS", id, "sex")
            end
            return "\{\"id\":\"#{id}\", \"name\":\"#{name}\", \"address\":\"#{address}\", \"sex\":\"#{sex}\"\}"
        end
end

Ramaze.start
