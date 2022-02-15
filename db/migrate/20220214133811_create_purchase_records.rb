class CreatePurchaseRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.string :p_topic
      t.decimal :p_price
      t.string :p_currency
      t.string :p_category
      t.integer :p_validity_period
      t.date :purchase_date
      t.date :expiry_date

      t.timestamps
    end
  end
end
