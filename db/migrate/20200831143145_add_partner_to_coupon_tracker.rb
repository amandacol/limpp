class AddPartnerToCouponTracker < ActiveRecord::Migration[5.2]
  def change
    add_reference :coupon_trackers, :partner, index: true, foreign_key: true
  end
end
