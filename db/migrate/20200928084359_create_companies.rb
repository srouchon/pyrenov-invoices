class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.integer :postcode
      t.string :city
      t.string :phone
      t.string :email
      t.string :siret

      t.timestamps
    end
  end
end
