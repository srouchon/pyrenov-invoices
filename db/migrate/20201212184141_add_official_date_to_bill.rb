class AddOfficialDateToBill < ActiveRecord::Migration[6.0]
  def change
    add_column :bills, :date, :date
  end
end
