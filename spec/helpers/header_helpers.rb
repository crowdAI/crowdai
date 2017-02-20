module Helpers
  def json(body)
    JSON.parse(body, symbolize_names: true)
  end

  def auth_header(token)
	  if token
	    ActionController::HttpAuthentication::Token.encode_credentials(token)
	  end
	end

end
