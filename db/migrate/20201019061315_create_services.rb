class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :ref_service
      t.string :description_service
      t.integer :unit_price
      t.integer :quantity
      t.integer :total_price_service

      t.timestamps
    end
  end
end
