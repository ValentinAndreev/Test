module SpecMacros
  def log_in_user(email, password)
    visit root_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Sign in'
  end
end