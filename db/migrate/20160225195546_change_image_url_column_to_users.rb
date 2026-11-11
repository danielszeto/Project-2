class ChangeImageUrlColumnToUsers < ActiveRecord::Migration[4.2]
  def change
    rename_column :users, :img_url, :file
  end
end
