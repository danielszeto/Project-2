class AddUserIdToTransactions < ActiveRecord::Migration[4.2]
  def change
    add_column :transactions, :userID, :integer
  end
end
