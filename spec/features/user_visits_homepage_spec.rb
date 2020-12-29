require 'rails_helper'

feature 'User visits homepage' do
  scenario 'successfully' do
    sign_in
    expect(page).to have_content('Sélectionner une entreprise')
  end
end