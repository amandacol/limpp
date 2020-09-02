class AddNameToCoupons < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :name, :string
  end
end
