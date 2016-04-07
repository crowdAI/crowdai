module LoginMacros
  def sign_in(participant)
    visit public_root_path
    click_link 'Sign In'
    fill_in 'Email', with: participant.email
    fill_in 'Password', with: participant.password
    click_button 'Log in'
  end
end
