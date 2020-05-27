class AddAverageToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :average, :float, :default => 0
  end
end
