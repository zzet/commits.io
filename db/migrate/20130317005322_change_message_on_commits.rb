class ChangeMessageOnCommits < ActiveRecord::Migration
  def up
    change_column :commits, :message, :text
  end

  def down
    change_column :commits, :message, :string
  end
end
