class ChangeImageUrlColumnToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :img_url, :file
  end
end
