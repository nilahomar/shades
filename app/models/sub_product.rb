class SubProduct < ApplicationRecord
  belongs_to :product
  has_many :color_shade
  has_many :orderProducts
  has_many :orders, through: :orderProducts
end
