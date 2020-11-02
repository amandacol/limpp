class CreateRequestedIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :requested_ingredients do |t|
      t.string :email
      t.string :name
      t.text :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
