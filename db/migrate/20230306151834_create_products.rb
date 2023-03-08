class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :rating
      t.string :description
      t.string :benefits
      t.string :brand_name

      t.timestamps
    end
  end
end
