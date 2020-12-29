class ChangeQuantityAndTotalPriceServiceToQuoteServices < ActiveRecord::Migration[6.0]
  def change
    change_column :quote_services, :quantity, :float
    change_column :quote_services, :total_price_service, :float
  end
end
