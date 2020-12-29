class CreateBillServices < ActiveRecord::Migration[6.0]
  def change
    create_table :bill_services do |t|
      t.references :bill, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.float :quantity
      t.float :total_price_service
    end
  end
end
