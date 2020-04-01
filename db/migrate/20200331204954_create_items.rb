class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :ingredient
      t.string :certification
      t.string :coupon

      t.timestamps
    end
  end
end
