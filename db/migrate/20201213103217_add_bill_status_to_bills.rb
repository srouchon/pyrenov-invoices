class AddBillStatusToBills < ActiveRecord::Migration[6.0]
  def change
    add_column :bills, :bill_status, :integer, default: 0
  end
end
