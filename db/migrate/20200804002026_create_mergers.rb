class CreateMergers < ActiveRecord::Migration[5.2]
  def change
    create_table :mergers do |t|
      t.references :ingredient, foreign_key: true
      t.references :purpose, foreign_key: true

      t.timestamps
    end
  end
end
