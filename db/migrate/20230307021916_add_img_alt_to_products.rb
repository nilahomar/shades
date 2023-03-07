class AddImgAltToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :img_alt, :string
  end
end
