class AddExternalTypeToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :external_type, :string
  end
end
