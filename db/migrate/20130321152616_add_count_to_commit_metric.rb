class AddCountToCommitMetric < ActiveRecord::Migration
  def change
    add_column :commit_metrics, :metric_count, :int
  end
end
