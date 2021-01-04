class RemoveColumnsToBillServices < ActiveRecord::Migration[6.0]
  def change
    remove_column :bill_services, :quantity
    remove_column :bill_services, :total_price_service
  end
end
