class AddSubcategoryToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :subcategory, :string
  end
end
