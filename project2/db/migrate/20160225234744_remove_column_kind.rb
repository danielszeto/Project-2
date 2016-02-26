class RemoveColumnKind < ActiveRecord::Migration
  def change
    remove_column :users, :kind, :string
  end
end
