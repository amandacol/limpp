class AddToxicityToIngredient < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :toxicity_ingredient, :integer
    Ingredient.find_each { |ingredient| ingredient.toxicityingredient_classifier && ingredient.save! }
  end
end
