require 'rails_helper'

feature 'User modifies company from company index page' do
  scenario 'successfully' do
    sign_in
    create_company
    click_on('Entreprises')
    modify_company('Entreprise1', 'Cours Portal', 33000, 'Bordeaux', '0505060606', 'entreprise1@test.com', '11111111111', 5)
    expect(page).to have_css('#company-name', text: 'Entreprise1')
  end
end