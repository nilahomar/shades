class AddSubProductToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :sub_product, null: false, foreign_key: true
  end
end
