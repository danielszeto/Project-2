class AddUserIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :userID, :integer
  end
end
