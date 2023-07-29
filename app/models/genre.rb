class Genre < ApplicationRecord
  has_many :orders, dependent: :destroy
end
