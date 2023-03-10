class ChangeColumnOrderIdToDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_null :order_products, :order_id, true
  end
end
