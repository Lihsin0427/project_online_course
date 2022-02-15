class ChangeTypeDateOfPurchaseRecord < ActiveRecord::Migration[6.1]
  def change
    change_column :purchase_records, :purchase_date, :datetime
    change_column :purchase_records, :expiry_date, :datetime
  end
end
