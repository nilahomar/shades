class AddShadeNameToColorShades < ActiveRecord::Migration[7.0]
  def change
    add_column :color_shades, :shade_name, :string
  end
end
