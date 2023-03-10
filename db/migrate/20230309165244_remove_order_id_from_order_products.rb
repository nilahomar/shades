class RemoveOrderIdFromOrderProducts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :order_products, :order, foreign_key: true, index: false
  end
end
