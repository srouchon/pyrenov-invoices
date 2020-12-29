class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :ref_client
      t.string :name
      t.string :address
      t.integer :postcode
      t.string :city
      t.string :phone_1
      t.string :phone_2
      t.string :email_1
      t.string :email_2
      t.string :siren
      t.string :siret
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
