class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :productID
      t.integer :buyerID
      t.integer :sellerID

      t.timestamps null: false
    end
  end
end
