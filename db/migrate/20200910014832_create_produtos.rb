class CreateProdutos < ActiveRecord::Migration[5.2]
  def change
    create_table :produtos do |t|
      t.string :email
      t.string :url

      t.timestamps
    end
  end
end
