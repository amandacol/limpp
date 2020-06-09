class AddWebsiteToCoupons < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :website, :string
  end
end
