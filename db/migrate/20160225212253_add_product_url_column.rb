class AddProductUrlColumn < ActiveRecord::Migration[4.2]
  def change
    add_column :products, :product_url, :string
  end
end
