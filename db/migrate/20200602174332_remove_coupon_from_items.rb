class RemoveCouponFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :coupon
  end
end
