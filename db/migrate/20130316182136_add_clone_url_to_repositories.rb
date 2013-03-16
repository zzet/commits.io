class AddCloneUrlToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :clone_url, :string
  end
end
