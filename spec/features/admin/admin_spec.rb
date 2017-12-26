require 'rails_helper'

feature "Admin's actions" do
  let!(:admin) { create(:user, role: 'admin') }

  before do 
    log_in_user(admin.email, admin.password)
    click_on 'My store'
  end

  scenario 'admin can create and delete  products' do
    fill_in "title", with: 'New product'
    fill_in "price", with: 10
    click_on 'Submit'
    expect(page).to have_content 'On store: 1 items'
    expect(page).to have_content 'New product'
    click_on 'Remove from store'
    expect(page).to have_content 'On store: 0 items'
    expect(page).to_not have_content 'New product'    
  end
end