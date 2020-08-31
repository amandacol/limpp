class Coupon < ApplicationRecord
  belongs_to :item
  has_many :coupon_trackers
  has_many :api_logs
end
