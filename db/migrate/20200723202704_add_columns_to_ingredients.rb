class AddColumnsToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :risk_to_health, :string
    add_column :ingredients, :risk_to_health_text, :text
    add_column :ingredients, :risk_to_enviroment, :string
    add_column :ingredients, :risk_to_enviroment_text, :text
    add_column :ingredients, :other_names, :string
    add_column :ingredients, :restrictions, :string
  end
end
