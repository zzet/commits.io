class CreateCommitMetrics < ActiveRecord::Migration
  def change
    create_table :commit_metrics do |t|
      t.integer :metric_id
      t.integer :commit_id
      t.string :data
      t.integer :user_id

      t.timestamps
    end
  end
end
