class RemoveQuantityAndTotalPriceServiceToServices < ActiveRecord::Migration[6.0]
  def change
    remove_column :services, :quantity
    remove_column :services, :total_price_service
  end
end
