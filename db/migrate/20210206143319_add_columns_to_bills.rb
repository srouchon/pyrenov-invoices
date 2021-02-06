class AddColumnsToBills < ActiveRecord::Migration[6.0]
  def change
    add_column :bills, :date_asked_payment, :date
    add_column :bills, :date_start_service, :date
    add_column :bills, :date_end_service, :date
  end
end
