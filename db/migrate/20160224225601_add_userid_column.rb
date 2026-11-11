class AddUseridColumn < ActiveRecord::Migration[4.2]
  def change
    add_column :products, :user_id, :integer
  end
end
