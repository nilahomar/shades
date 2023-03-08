class Product < ApplicationRecord
  has_many :sub_products, dependent: :destroy
end
