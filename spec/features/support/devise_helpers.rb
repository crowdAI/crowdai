module DeviseHelpers

  def visit_page
    visit 'participants/sign_in'
    self
  end

  def login(participant)
    fill_in 'Email',      with: participant.email
    fill_in 'Password',   with: participant.password
    click_button 'Log in'
  end

end
