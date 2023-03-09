class AddColorShadeReferencesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :color_shade, null: true, foreign_key: true
  end
end
