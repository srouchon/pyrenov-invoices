class AddUserIdToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_reference :companies, :user, index: true
  end
end
