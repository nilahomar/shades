class AddShadeHexToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :shade_hex, :string
  end
end
