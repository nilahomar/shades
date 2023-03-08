class SubProduct < ApplicationRecord
  belongs_to :product
  has_many :color_shade
end
