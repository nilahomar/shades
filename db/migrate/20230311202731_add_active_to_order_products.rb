class AddActiveToOrderProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :order_products, :active, :boolean
  end
end
