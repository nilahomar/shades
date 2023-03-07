class AddImgMainToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :img_main, :string
  end
end
