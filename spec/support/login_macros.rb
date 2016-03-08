module LoginMacros

  def sign_in(user)
      visit public_root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
  end

end
