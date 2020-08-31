class CouponTracker < ApplicationRecord
  belongs_to :coupon
  belongs_to :partner
end
