class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :authen_token
      t.string :email

      t.timestamps
    end
    add_index :partners, :authen_token, unique: true
  end
end
