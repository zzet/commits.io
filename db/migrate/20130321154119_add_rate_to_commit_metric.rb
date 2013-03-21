class AddRateToCommitMetric < ActiveRecord::Migration
  def change
    add_column :commit_metrics, :rate, :float
  end
end
