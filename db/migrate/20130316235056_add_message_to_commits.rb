class AddMessageToCommits < ActiveRecord::Migration
  def change
    add_column :commits, :message, :string
  end
end
