class AddQuoteStatusToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :quote_status, :integer, default: 0
  end
end
