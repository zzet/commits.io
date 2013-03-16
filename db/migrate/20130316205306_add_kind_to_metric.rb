class AddKindToMetric < ActiveRecord::Migration
  def change
    add_column :metrics, :kind, :string
  end
end
