class CreateSubProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_products do |t|
      t.string :name
      t.string :shade_hex
      t.string :img_main
      t.string :img_alt
      t.references :product, null: false, foreign_key: true
      t.references :color_shade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
