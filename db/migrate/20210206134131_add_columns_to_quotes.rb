class AddColumnsToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :date_asked_payment, :date
    add_column :quotes, :date_start_service, :date
    add_column :quotes, :date_end_service, :date
  end
end
