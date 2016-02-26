class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :category
      t.string :description
      t.string :available

      t.timestamps null: false
    end
  end
end
