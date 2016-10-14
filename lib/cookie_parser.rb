require "cookie_parser/version"

module CookieParser


  class Cookie

    # initialize cookie froma string
  	def initialize cookie_string
      # bellow example of a cookie string from https://www.instagram.com/p/BLbV86FBmu0/
      # -------------------------------------------------------------------------------
      # "csrftoken=GhRk1XSBpLRbd2pjjk0YBnHO0CEQz3G4; expires=Fri, 13-Oct-2017 11:08:47 GMT; 
      # Max-Age=31449600; Path=/; secures_network=; expires=Fri, 14-Oct-2016 12:08:47 GMT; 
      # Max-Age=3600; Path=/sessionid=IGSCc28783cc519737acd5641c8067e7fcc7216741628a175672cee23b80a3f2c49b%3ARDitnm7Tzu0RxLm0JIpCC73pBXyy9ARL%3A%7B%22_token_ver%22%3A2%2C%22_auth_user_id%22%3A3895762258%2C%22_token%22%3A%223895762258%3ARidD3xQbLfbWgT8ZVUHVRQ64Kq3ahjAq%3Ace4543083972b42537159586e13b61c536b5060e64f28468022b97d304eb907f%22%2C%22asns%22%3A%7B%2277.154.204.241%22%3A15557%2C%22time%22%3A1476443327%7D%2C%22_auth_user_backend%22%3A%22accounts.backends.CaseInsensitiveModelBackend%22%2C%22last_refreshed%22%3A1476443327.444875%2C%22_platform%22%3A4%2C%22_auth_user_hash%22%3A%22%22%7D;
      # expires=Thu, 12-Jan-2017 11:08:47 GMT; httponly; Max-Age=7776000; Path=/; secureds_user_id=3895762258;
      # expires=Thu, 12-Jan-2017 11:08:47 GMT; Max-Age=7776000; Path=/"
      items = cookie_string.split '; '
      
      items.each{ |item|
        $stderr.puts item
        key_value = item.split "="
        instance_variable_set( "@%s"% [sanitize_key(key_value[0])], key_value[1] ) # if key_value.size == 2
      }
      
  	end


    private


    def sanitize_key key
      key.gsub! '-', '_'
      key.gsub! ' ', ''
      key.gsub! ',', ''
      key.downcase!
      return key
    end
  	
  	
  end

end
