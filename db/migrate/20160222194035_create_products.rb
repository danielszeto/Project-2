class CreateProducts < ActiveRecord::Migration[4.2]
  def change
    create_table :products do |t|
      t.string :category
      t.string :description
      t.string :available

      t.timestamps null: false
    end
  end
end
