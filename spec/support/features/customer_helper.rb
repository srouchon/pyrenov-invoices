module Features
  def create_customer
    create_customer_as('CLT1', 'Client1', 'Cours Portal', 33000, 'Bordeaux', '0505050505', 'client1@test.com', '11111111111')
  end
  
  def create_customer_as(ref_client, name, address, postcode, city, phone_1, email_1, siret)
    click_on('Créer un nouveau client')
    fill_in("Référence",	with: ref_client)
    fill_in("Dénomination",	with: name)
    fill_in("Adresse",	with: address)
    fill_in("Code postal",	with: postcode)
    fill_in("Ville",	with: city)
    fill_in("Téléphone 1",	with: phone_1)
    fill_in("Email 1",	with: email_1)
    fill_in("SIRET",	with: siret)
    click_on('Créer ce client')
  end
end