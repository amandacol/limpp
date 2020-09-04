class RemoveArticleFromIngredient < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :article
  end
end
