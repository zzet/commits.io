class AddCommittedAtToCommits < ActiveRecord::Migration
  def change
    add_column :commits, :committed_at, :timestamp
  end
end
