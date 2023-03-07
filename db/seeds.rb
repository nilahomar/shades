# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.destroy_all

require 'json'
# this is my seed page

color_shades = {
  'monk1' => '#f6ede4',
  'monk2' => '#f3e7db',
  'monk3' => '#f7ead0',
  'monk4' => '#eadaba',
  'monk5' => '#d7bd96',
  'monk6' => '#a07e56',
  'monk7' => '#825c43',
  'monk8' => '#604134',
  'monk9' => '#3a312a',
  'monk10' => '#292420'
}

def hex_to_rgb(hex_val)
  # converts #f6ede4 to [246, 237, 228]
  return hex_val.match(/^#(..)(..)(..)$/).captures.map(&:hex)
end

def euclidean_distance(vector1, vector2)
  sum = 0
  vector1.zip(vector2).each do |v1, v2|
    component = (v1 - v2)**2
    sum += component
  end
  return Math.sqrt(sum)
end

def find_closest_shade(shade_hex, color_shades_rgb)
  target = hex_to_rgb(shade_hex)
  p color_shades_rgb.map { |key, value| [euclidean_distance(target, value), key] }.min
  return color_shades_rgb.map { |key, value| [euclidean_distance(target, value), key] }.min[1]
end

def create_product(path, color_shades)
  file = File.read(path)
  data_hash = JSON.parse(file)

  color_shades_rgb = color_shades.map { |k, v| [k, hex_to_rgb(v)] }
  all_products = []

  data_hash.each do |_k, product_val|
    product_val['variants'].each do |variant|
      sn = find_closest_shade(variant['shade_hex'], color_shades_rgb)
      color_shade_obj = ColorShade.where(shade_name: sn).take
      all_products << {
        'name' => variant['name'],
        'shade_hex' => variant['shade_hex'],
        'product_name' => variant['product_name'],
        'brand_name' => variant['brand_name'],
        'rating' => product_val['rating'],
        'benefits' => product_val['benefits'],
        'description' => product_val['description'],
        'img_main' => variant['cloudinary_url'][0],
        'img_alt' => variant['cloudinary_url'][1],
        'color_shade_id' => color_shade_obj.id
      }
    end
  end
  Product.create(all_products)
end

def creat_color_shades(color_shades)
  ColorShade.create(color_shades.map { |key, value| { "shade_name" => key, "shade_hex" => value } })
end

creat_color_shades(color_shades)
create_product('db/cloudinary_data_page_1.json', color_shades)
