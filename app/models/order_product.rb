class OrderProduct < ApplicationRecord
  belongs_to :sub_product
  belongs_to :user
end
