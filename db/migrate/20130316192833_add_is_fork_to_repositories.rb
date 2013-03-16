class AddIsForkToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :is_fork, :boolean
  end
end
