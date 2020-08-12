class ChangeClassificationFromIngredientToObservation < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :classification, :string
    add_column :ingredients, :observation, :text
  end
end
