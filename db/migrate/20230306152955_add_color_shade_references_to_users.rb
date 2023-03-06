class AddColorShadeReferencesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :color_shade, null: false, foreign_key: true
  end
end
