class CreateColorShades < ActiveRecord::Migration[7.0]
  def change
    create_table :color_shades do |t|

      t.timestamps
    end
  end
end
