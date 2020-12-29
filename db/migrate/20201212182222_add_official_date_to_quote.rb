class AddOfficialDateToQuote < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :date, :date
  end
end
