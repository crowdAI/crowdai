# frozen_string_literal: true
module HeaderHelpers
  def json(body)
    JSON.parse(body, symbolize_names: true)
  end

  def auth_header(api_key)
    ActionController::HttpAuthentication::Token.encode_credentials(api_key)
  end

  def http_basic_login
    @env ||= {}
    user = 'username'
    pw = env['CROWDAI_API_KEY']
    @env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end

end
