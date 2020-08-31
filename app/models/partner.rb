class Partner < ApplicationRecord
  has_secure_token :authen_token
end
