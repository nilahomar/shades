class AddSubProductToFavourites < ActiveRecord::Migration[7.0]
  def change
    add_reference :favourites, :sub_product, null: false, foreign_key: true
  end
end
