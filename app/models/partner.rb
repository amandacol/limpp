class Partner < ApplicationRecord
  has_secure_token :authen_token
  has_many :coupon_trackers
  has_many :api_logs
end
