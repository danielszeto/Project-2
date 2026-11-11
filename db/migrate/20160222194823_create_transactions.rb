class CreateTransactions < ActiveRecord::Migration[4.2]
  def change
    create_table :transactions do |t|
      t.integer :productID
      t.integer :buyerID
      t.integer :sellerID

      t.timestamps null: false
    end
  end
end
