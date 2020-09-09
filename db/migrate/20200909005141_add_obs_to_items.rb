class AddObsToItems < ActiveRecord::Migration[5.2]
  def change
     add_column :items, :obs, :text
  end
end
