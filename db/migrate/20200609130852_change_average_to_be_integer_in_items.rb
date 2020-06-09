class ChangeAverageToBeIntegerInItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :average, :float, :default => 0
    add_column :items, :average, :integer, :default => 0
  end
end
