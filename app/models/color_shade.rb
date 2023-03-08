class ColorShade < ApplicationRecord
  has_many :users
  has_many :sub_products
end
