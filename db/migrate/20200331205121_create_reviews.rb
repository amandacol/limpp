class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :stars
      t.string :buyagain
      t.string :attributes
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
