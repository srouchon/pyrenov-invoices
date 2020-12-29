module Features
  def create_service
    create_service_as('PREST1', 'Peinture en m2', 20)
  end
  
  def create_service_as(ref_service, description_service, unit_price)
    click_on('Créer une prestation')
    fill_in("Référence Prestation",	with: ref_service)
    fill_in("Description",	with: description_service)
    fill_in("Prix unitaire",	with: unit_price)
    click_on('Créer cette prestation')
  end
end