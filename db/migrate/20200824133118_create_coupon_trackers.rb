class CreateCouponTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :coupon_trackers do |t|
      t.string :coupon_name
      t.string :customer

      t.timestamps
    end
  end
end
