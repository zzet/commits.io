class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :path
      t.references :ownerable, polymorphic: true

      t.timestamps
    end
  end
end
