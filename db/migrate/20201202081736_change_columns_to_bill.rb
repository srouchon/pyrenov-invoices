class ChangeColumnsToBill < ActiveRecord::Migration[6.0]
  def change
    change_column :bills, :deposit, :float
    change_column :bills, :price_duty_free, :float
    change_column :bills, :price_all_taxes, :float
  end
end
