class RenameLastNameToImage < ActiveRecord::Migration
  def change
    rename_column :users, :last_name, :image
  end
end
