class AddPercentToCommitMetric < ActiveRecord::Migration
  def change
    add_column :commit_metrics, :percent, :integer
  end
end
