module Features
  def create_company
    create_company_as('Entreprise1', 'Cours Portal', 33000, 'Bordeaux', '0505050505', 'entreprise1@test.com', '11111111111', 20)
  end
  
  def create_company_as(name, address, postcode, city, phone, email, siret, tva)
    click_on('Créer une nouvelle entreprise')
    fill_in("Dénomination sociale",	with: name)
    fill_in("Adresse",	with: address)
    fill_in("Code postal",	with: postcode)
    fill_in("Ville",	with: city)
    fill_in("Téléphone",	with: phone)
    fill_in("Email",	with: email)
    fill_in("SIRET",	with: siret)
    fill_in("TVA",	with: tva)
    click_on('Créer cette entreprise')
  end
  
  def modify_company(name, address, postcode, city, phone, email, siret, tva)
    find('.edit').click
    expect(page).to have_css('h1', text: "Modifier les informations du l'entreprise")
    fill_in("Dénomination sociale",	with: name)
    fill_in("Adresse",	with: address)
    fill_in("Code postal",	with: postcode)
    fill_in("Ville",	with: city)
    fill_in("Téléphone",	with: phone)
    fill_in("Email",	with: email)
    fill_in("SIRET",	with: siret)
    fill_in("TVA",	with: tva)
    click_on('Modifier cette entreprise')
  end
  
end