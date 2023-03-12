class Order < ApplicationRecord
  belongs_to :user
  belongs_to :sub_product
end
