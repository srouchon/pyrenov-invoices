class ChangeColumnsToQuote < ActiveRecord::Migration[6.0]
  def change
    change_column :quotes, :deposit, :float
    change_column :quotes, :price_duty_free, :float
    change_column :quotes, :price_all_taxes, :float
  end
end
