class AddOtherToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :other, :text
  end
end
