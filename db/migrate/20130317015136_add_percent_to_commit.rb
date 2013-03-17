class AddPercentToCommit < ActiveRecord::Migration
  def change
    add_column :commits, :percent, :integer
  end
end
