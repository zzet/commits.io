class AddSourceFieldToRepository < ActiveRecord::Migration
  def change
    add_column :repositories, :source, :string
  end
end
