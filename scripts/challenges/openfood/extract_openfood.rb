# tmp_1056 - all records
CREATE TABLE tmp_1033 AS
SELECT i.id, i.imageable_id
FROM images i,
     categorisations c
WHERE c.categorisable_id = i.id
AND c.category_id = 1
AND EXISTS (SELECT 'x' FROM products p WHERE status = 'complete' AND i.imageable_id = p.id)
AND EXISTS (SELECT 'x' FROM transformations t WHERE t.image_id = i.id)


# tmp 500 - participant set
CREATE TABLE tmp_500 AS
SELECT i.id, i.imageable_id
FROM images i,
     categorisations c
WHERE c.categorisable_id = i.id
AND c.category_id = 1
AND EXISTS (SELECT 'x' FROM products p WHERE status = 'complete' AND i.imageable_id = p.id)
AND EXISTS (SELECT 'x' FROM transformations t WHERE t.image_id = i.id)
ORDER BY random() LIMIT 500


# tmp 100 secret set
CREATE TABLE tmp_100 AS
SELECT i.id, i.imageable_id
FROM images i,
     categorisations c
WHERE c.categorisable_id = i.id
AND c.category_id = 1
AND EXISTS (SELECT 'x' FROM products p WHERE status = 'complete' AND i.imageable_id = p.id)
AND EXISTS (SELECT 'x' FROM transformations t WHERE t.image_id = i.id)
AND i.imageable_id NOT IN (SELECT imageable_id FROM tmp_500)
ORDER BY random() LIMIT 100



# get participant images
sql = "select * from images where id in (select id from tmp_500)"

results = Image.find_by_sql(sql)


results.each { |image| puts "wget --output-document image-#{image.imageable_id}.jpg #{image.data.url(:xlarge)} " }


\f ','
\a
\o '/filename.csv'
query
\q


  # get participant data table (training.csv)
  SELECT product_id, nutrient_id, COALESCE(per_hundred,-1.0) as per_hundred, COALESCE(per_portion,-1.0) as per_portion, COALESCE(per_day,-1.0) as per_day
  FROM product_nutrients
  WHERE product_id IN (SELECT imageable_id FROM tmp_500)
  UNION ALL
  SELECT t.imageable_id, n.id, -1.0, -1.0, -1.0
  FROM nutrients n, tmp_500 t
  WHERE t.imageable_id IN (SELECT imageable_id FROM tmp_500)
  AND NOT EXISTS (SELECT 'x' FROM product_nutrients pn WHERE pn.product_id = t.imageable_id AND pn.nutrient_id = n.id)
  ORDER BY product_id, nutrient_id


  # all -1s
  SELECT t.imageable_id, n.id, -1.0, -1.0, -1.0
  FROM nutrients n, tmp_500 t
  WHERE t.imageable_id IN (SELECT imageable_id FROM tmp_500)
  order by 1,2

  SELECT t.imageable_id, n.id, -1.0, -1.0, -1.0
  FROM nutrients n, tmp_1033 t
  WHERE t.imageable_id IN (SELECT imageable_id FROM tmp_1033)
  order by 1,2

  # secret 533
  SELECT product_id, nutrient_id, COALESCE(per_hundred,-1.0) as per_hundred, COALESCE(per_portion,-1.0) as per_portion, COALESCE(per_day,-1.0) as per_day
  FROM product_nutrients
  WHERE product_id IN (select imageable_id from tmp_1033 except select imageable_id from tmp_500)
  UNION ALL
  SELECT t.imageable_id, n.id, -1.0, -1.0, -1.0
  FROM nutrients n, tmp_500 t
  WHERE t.imageable_id IN (select imageable_id from tmp_1033 except select imageable_id from tmp_500)
  AND NOT EXISTS (SELECT 'x' FROM product_nutrients pn WHERE pn.product_id = t.imageable_id AND pn.nutrient_id = n.id)
  ORDER BY product_id, nutrient_id

  # entire set
  SELECT product_id, nutrient_id, COALESCE(per_hundred,-1.0) as per_hundred, COALESCE(per_portion,-1.0) as per_portion, COALESCE(per_day,-1.0) as per_day
  FROM product_nutrients
  WHERE product_id IN (select imageable_id from tmp_1033)
  UNION ALL
  SELECT t.imageable_id, n.id, -1.0, -1.0, -1.0
  FROM nutrients n, tmp_1033 t
  WHERE t.imageable_id IN (select imageable_id from tmp_1033)
  AND NOT EXISTS (SELECT 'x' FROM product_nutrients pn WHERE pn.product_id = t.imageable_id AND pn.nutrient_id = n.id)
  ORDER BY product_id, nutrient_id
