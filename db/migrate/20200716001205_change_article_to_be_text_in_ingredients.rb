class ChangeArticleToBeTextInIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :article, :string
    add_column :ingredients, :article, :text
  end
end
