class CreateQuoteServices < ActiveRecord::Migration[6.0]
  def change
    create_table :quote_services do |t|
      t.references :quote, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
