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
