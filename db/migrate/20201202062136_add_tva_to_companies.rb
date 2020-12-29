class AddTvaToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :tva, :float
  end
end
