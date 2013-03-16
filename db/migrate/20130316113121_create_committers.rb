class CreateCommitters < ActiveRecord::Migration
  def change
    create_table :committers do |t|
      t.string :name
      t.string :email
      t.integer :organization_id
      t.integer :user_id

      t.timestamps
    end
  end
end
