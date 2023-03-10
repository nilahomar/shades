class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :sub_products, through: :order_products
end
