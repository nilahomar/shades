class SubProduct < ApplicationRecord
  belongs_to :product
  belongs_to :color_shade
  has_many :orderProducts
  has_many :orders, through: :orderProducts
end
