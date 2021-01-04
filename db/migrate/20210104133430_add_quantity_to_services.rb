class AddQuantityToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :quantity, :integer
  end
end
