Doorkeeper.configure do
  orm :active_record
  # This block will be called to check whether the
  # resource owner is authenticated or not
  resource_owner_authenticator do |routes|
    #Participant.find_by_id(id: session[:participant_id]) || redirect_to(new_session_url(return_to: request.fullpath))
    if participant_signed_in?
      current_participant
    else 
	    redirect_to(new_session_url(return_to: request.fullpath))
    end
  end

  # If you want to restrict the access to the web interface for
  # adding oauth authorized applications you need to declare the
  # block below
  # admin_authenticator do |routes|
  #   # Put your admin authentication logic here.
  #   # If you want to use named routes from your app you need
  #   # to call them on routes object eg.
  #   # routes.new_admin_session_path
  #   Admin.find_by_id(session[:admin_id]) || redirect_to routes.new_admin_session_path
  # end

  #resource_owner_from_credentials do
  #   request.params[:participant] = {:email => request.params[:name], :password => request.params[:password]}
  #   request.env["devise.allow_params_authentication"] = true
  #   user = request.env["warden"].authenticate!(:scope => :participant)
  #   env['warden'].logout
  #   participant
  #end

  # Access token expiration time (default 2 hours)
  access_token_expires_in 2.hours
  #access_token_expires_in 1.minutes

  # Issue access tokens with refresh token (disabled by default)
  use_refresh_token

  # Define access token scopes for your provider
  # For more information go to https://github.com/applicake/doorkeeper/wiki/Using-Scopes
  default_scopes  :public
  optional_scopes :write
end
