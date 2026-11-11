class RenameIdColumns < ActiveRecord::Migration[4.2]
 def change
    rename_column :transactions, :productID, :product_id
    rename_column :transactions, :userID, :user_id
  end
end
