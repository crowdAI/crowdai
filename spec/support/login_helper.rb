module LoginHelper

  def sign_in(participant)
    visit '/'
    click_link 'Log in'
    fill_in 'Email address', with: participant.email
    fill_in 'Password', with: participant.password
    click_button 'Log in'
  end

end
