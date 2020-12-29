puts 'Clean DB'
User.destroy_all
Company.destroy_all
Quote.destroy_all
Bill.destroy_all
Customer.destroy_all
Service.destroy_all

puts 'Create some users'
user1 = User.create!(email: 'sophie@test.com', password: 'sophie', firstname: 'Sophie', lastname: 'Rouchon', admin: true)
user2 = User.create!(email: 'baptiste@test.com', password: 'baptiste', firstname: 'Baptiste', lastname: 'Dupont', admin: false)


puts 'Create some compamies'
company1 = Company.new(name: 'Entreprise1', address: 'Cours Portal', postcode: 33000, city: 'Bordeaux', phone: '0505050505', email: 'entreprise1@test.com', siret: '11111111111', tva: 20)
company1.user = user1
company1.save!
company2 = Company.new(name: 'Entreprise2', address: 'Cours Saint Louis', postcode: 33000, city: 'Bordeaux', phone: '0505050505', email: 'entreprise2@test.com', siret: '12111111113', tva: 5.5)
company2.user = user1
company2.save!

puts 'Create some services'
service1 = Service.new(ref_service: 'PREST1', description_service: 'Peinture en m2', unit_price: 15)
service1.company = company1
service1.save!
service2 = Service.new(ref_service: 'PREST2', description_service: 'Carrelage en m2', unit_price: 22)
service2.company = company1
service2.save!

puts 'Create some customers'
client1 = Customer.new(ref_client: 'CL001', name: 'Client1', address: 'Place des Quinconces', postcode: 33000, city: 'Bordeaux', phone_1: '0505050505', email_1: 'client1@test.com', phone_2: '0505050505', email_2: 'client1@test.com', siren: '113411', siret: '11341111111')
client1.company = company1
client1.save!
client2 = Customer.new(ref_client: 'CL002', name: 'Client2', address: 'Place de la Victoire', postcode: 33000, city: 'Bordeaux', phone_1: '0505050505', email_1: 'client2@test.com', phone_2: '0505050505', email_2: 'client2@test.com', siren: '113451', siret: '113411555111')
client2.company = company1
client2.save!

puts 'Finished'