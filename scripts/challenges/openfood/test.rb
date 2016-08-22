image = Image.find(4305)
puts "wget --output-document image-#{image.product_id}.jpg #{image.data.url(:xlarge)} "
