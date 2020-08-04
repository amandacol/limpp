class Purpose < ApplicationRecord
  has_many :mergers, dependent: :destroy
end
