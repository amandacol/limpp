class RemoveCategoryAndSubcategoryFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :category
    remove_column :items, :subcategory
  end
end
