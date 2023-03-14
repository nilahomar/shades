class AddDeliveryDateToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :delivery_date, :datetime
  end
end
