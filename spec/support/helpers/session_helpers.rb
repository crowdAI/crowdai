# frozen_string_literal: true
RSpec.configure do

  def expect_to_not_be_authorized
    expect(response).to have_http_status(401)
    expect(response.body).to eql 'You are not authorised to access this page.'
  end

  def asks_to_sign_in
    expect(response).to redirect_to new_participant_session_path
    #expect(flash[:error]).to match(
    #  /You need to sign in or sign up before continuing./
    #)
  end

  def denies_access
    expect(response).to have_http_status(302)
    expect(response).to redirect_to root_path
    expect(flash[:error]).to match(/You are not authorised to access this page./)
  end

  def is_not_authorized
    expect(response).to have_http_status(401)
    expect(response.body).to eql 'You are not authorized to access this page.'
  end

  def api_not_authorized
    expect(response).to have_http_status(401)
    expect(response.body).to eql "HTTP Token: Access denied.\n"
  end

  #def denies_access
  #  expect(response).to have_http_status(401)
  #  expect(flash[:info]).to match(/You are not authorized to access this page./)
  #end
end
