class CreateRequestedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :requested_items do |t|
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
