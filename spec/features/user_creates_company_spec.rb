require 'rails_helper'

feature 'User creates company' do
  scenario 'successfully' do
    sign_in
    create_company
    expect(page).to have_css('#company-name', text: 'Entreprise1')
  end
end