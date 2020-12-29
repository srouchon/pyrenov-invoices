module Features
  def sign_in
    sign_in_as('example3@test.com', 'testpassword', 'TestFirstname', 'TestLastname')
  end
  
  def sign_in_as(email, password, firstname, lastname)
    user = User.create!(email: email, password: password, firstname: firstname, lastname: lastname)
    visit root_path
    fill_in "Email",	with: user.email
    fill_in "Mot de passe",	with: user.password 
    click_on("Se connecter")
  end
end