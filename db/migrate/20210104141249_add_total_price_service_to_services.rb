class AddTotalPriceServiceToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :total_price_service, :integer
  end
end
