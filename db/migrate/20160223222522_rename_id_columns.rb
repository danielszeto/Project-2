class RenameIdColumns < ActiveRecord::Migration
 def change
    rename_column :transactions, :productID, :product_id
    rename_column :transactions, :userID, :user_id
  end
end
