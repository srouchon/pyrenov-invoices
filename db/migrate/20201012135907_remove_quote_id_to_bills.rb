class RemoveQuoteIdToBills < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bills, :quote, index: true, foreign_key: true
  end
end
