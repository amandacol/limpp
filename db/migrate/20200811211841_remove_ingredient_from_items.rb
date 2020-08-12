class RemoveIngredientFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :ingredient
  end
end
