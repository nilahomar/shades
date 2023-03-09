class UpdateOrderProductSubProductRelation < ActiveRecord::Migration[7.0]
  def change
    remove_reference :order_products, :product, foreign_key: true, index: false
    add_reference :order_products, :sub_product, foreign_key: true
  end
end
