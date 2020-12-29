class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.string :ref_quote
      t.references :customer, null: false, foreign_key: true
      t.text :description
      t.integer :deposit
      t.integer :price_duty_free
      t.integer :price_all_taxes

      t.timestamps
    end
  end
end
