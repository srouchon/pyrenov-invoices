class AddOtherToBills < ActiveRecord::Migration[6.0]
  def change
    add_column :bills, :other, :text
  end
end
