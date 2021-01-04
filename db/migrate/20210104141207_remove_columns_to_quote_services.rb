class RemoveColumnsToQuoteServices < ActiveRecord::Migration[6.0]
  def change
    remove_column :quote_services, :quantity
    remove_column :quote_services, :total_price_service
  end
end
