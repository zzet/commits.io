class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha
      t.string :parent_sha
      t.integer :repository_id
      t.integer :committer_id
      t.text :diff

      t.timestamps
    end
  end
end
