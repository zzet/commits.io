class AddDescriptionToRepositories < ActiveRecord::Migration
  def change
    # 255 symbols should be enouth
    add_column :repositories, :description, :string
  end
end
