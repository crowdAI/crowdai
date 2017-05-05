# frozen_string_literal: true
module HeaderHelpers
  def json(body)
    JSON.parse(body, symbolize_names: true)
  end

  def auth_header(api_key)
    ActionController::HttpAuthentication::Token.encode_credentials(api_key)
  end

end
