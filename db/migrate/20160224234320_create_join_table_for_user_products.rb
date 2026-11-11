class CreateJoinTableForUserProducts < ActiveRecord::Migration[4.2]
  def change
    create_table :products_users, id: false do |t|
      t.belongs_to :product
      t.belongs_to :user
      end
    end
  end