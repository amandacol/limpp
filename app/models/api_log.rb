class ApiLog < ApplicationRecord
  belongs_to :coupon, optional: true
  belongs_to :partner, optional: true
end
