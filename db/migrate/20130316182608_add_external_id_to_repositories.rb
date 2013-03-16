class AddExternalIdToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :external_id, :string
  end
end
