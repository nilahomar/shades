require 'json'
# this is my seed page

User.destroy_all
Product.destroy_all
SubProduct.destroy_all
ColorShade.destroy_all

User.create(email: "test@test.com", password: "123456", first_name: "nila", last_name: "homar")
# color_shades = {
#   'monk1' => '#f6ede4',
#   'monk2' => '#f3e7db',
#   'monk3' => '#f7ead0',
#   'monk4' => '#eadaba',
#   'monk5' => '#d7bd96',
#   'monk6' => '#a07e56',
#   'monk7' => '#825c43',
#   'monk8' => '#604134',
#   'monk9' => '#3a312a',
#   'monk10' => '#292420'
# }

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
  return color_shades_rgb.map { |key, value| [euclidean_distance(target, value), key] }.min[1]
end

def load_json(path)
  file = File.read(path)
  return JSON.parse(file)
end

def create_color_shades(data_hash)
  color_shade_product_id = '31323'
  color_shades = []
  data_hash[color_shade_product_id]['variants'].each do |variant|
    color_shades << { "shade_name" => variant['name'], "shade_hex" => variant['shade_hex'] }
  end
  ColorShade.create(color_shades)
  return color_shades
end

def create_product(data_hash, color_shades)
  color_shades_rgb = color_shades.map { |item| [item['shade_name'], hex_to_rgb(item['shade_hex'])] }

  data_hash.each do |_k, product|
    product_id = Product.create({
      'name' => product['name'],
      'brand_name' => product['variants'][0]['brand_name'],
      'rating' => product['rating'],
      'benefits' => product['benefits'],
      'description' => product['description'],
      'price' => product['price']
    }).id

    sub_products = []
    product['variants'].each do |variant|
      sn = find_closest_shade(variant['shade_hex'], color_shades_rgb)
      color_shade_obj = ColorShade.where(shade_name: sn).take
      sub_products << {
        'name' => variant['name'],
        'shade_hex' => variant['shade_hex'],
        'img_main' => variant['cloudinary_url'][0],
        'img_alt' => variant['cloudinary_url'][0], # TODO
        'color_shade_id' => color_shade_obj.id,
        'product_id' => product_id
      }
    end
    SubProduct.create(sub_products)
  end
end

data_hash = load_json("db/cloudinary_data_no_bg.json")
color_shades = create_color_shades(data_hash)
create_product(data_hash, color_shades)
