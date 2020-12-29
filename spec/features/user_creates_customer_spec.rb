require 'rails_helper'

feature 'User creates customer' do
  scenario 'successfully' do
    sign_in
    create_company
    click_on("Clients")
    create_customer
    expect(page).to have_css('#ref-customer', text: 'CLT1')
  end
end