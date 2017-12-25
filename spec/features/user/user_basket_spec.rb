require 'rails_helper'

feature "Admin's actions" do
  let!(:admin) { create(:user, role: 'admin') }  
  let!(:user) { create(:user, role: 'user', email: 'user@mail.com') }

  before do 
    log_in_user(admin.email, admin.password)
    click_on 'My store'
    fill_in "item[title]", with: 'Product'
    fill_in "item[price]", with: 10
    click_on 'Submit'
    expect(page).to have_content 'On store: 1 items'
  end

  scenario 'user can add and remove product to basket' do
    click_on 'Logout'
    log_in_user(user.email, user.password)
    click_on 'My basket'
    click_on 'Add to basket'
    expect(page).to have_content 'My basket: 1 items'
    expect(page).to have_content 'with total price: 10.0'
    click_on 'Remove from basket'
    expect(page).to have_content 'My basket: 0 items'
    expect(page).to have_content 'with total price: 0.0'
  end
end