class Order < ApplicationRecord
  belongs_to :user
  has_many :orderProducts
  has_many :sub_products, through: :orderProducts
end
