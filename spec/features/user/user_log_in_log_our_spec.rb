require 'rails_helper'

feature "User's actions" do
  let!(:user) { create(:user) }

  scenario 'login with right email and password' do
    log_in_user(user.email, user.password)
    expect(page).to have_content 'Signed in successfully.'
  end  

  scenario "not registered user can't be logined" do
    log_in_user('wrong@mail.com', 'wrong_password')
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'logout' do
    log_in_user(user.email, user.password)
    click_on 'Logout'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end