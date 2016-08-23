header = 'product_id,nutrition_id,per_hundred,per_portion,percent\n'

File.open('testfile.csv', 'w') do |f|
  f.write(header)
  (7000..7005).each do |i|
    (1..16).each do |j|
      line = "#{i},#{j},-1,-1,-1\n"
      f.write(line)
    end
  end
end


p = Product.find([6999,1779])


SELECT product_id, nutrient_id, per_hundred, per_portion, per_day FROM product_nutrients WHERE product_id = 6999
UNION ALL
SELECT 6999, id, -1, -1, -1 FROM nutrients WHERE id NOT IN (SELECT nutrient_id FROM product_nutrients WHERE product_id = 6999)
