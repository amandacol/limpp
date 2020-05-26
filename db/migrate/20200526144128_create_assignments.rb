class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :item, foreign_key: true
      t.references :wishlist, foreign_key: true

      t.timestamps
    end
  end
end
