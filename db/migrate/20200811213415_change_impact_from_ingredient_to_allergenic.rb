class ChangeImpactFromIngredientToAllergenic < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :impact, :string
    add_column :ingredients, :allergenic, :string
  end
end
