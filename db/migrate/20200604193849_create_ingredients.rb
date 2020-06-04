class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :classification
      t.string :impact
      t.string :article

      t.timestamps
    end
  end
end
