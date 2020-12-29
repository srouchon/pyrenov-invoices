class AddQuantityAndTotalPriceServiceToQuoteServices < ActiveRecord::Migration[6.0]
  def change
    add_column :quote_services, :quantity, :integer
    add_column :quote_services, :total_price_service, :integer
  end
end
