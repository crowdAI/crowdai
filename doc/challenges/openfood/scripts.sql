/* 7207 */
SELECT '| 7207 |',
         n.id,
        '|',
       CASE WHEN np_vw.per_hundred IS NULL THEN -1 ELSE np_vw.per_hundred END,
        '|',
       CASE WHEN np_vw.per_portion IS NULL THEN -1 ELSE np_vw.per_portion END,
        '|',
       --CASE WHEN np_vw.portion_quantity IS NULL THEN -1 ELSE np_vw.portion_quantity END,
       -- '|',
       CASE WHEN np_vw.per_day IS NULL THEN -1 ELSE np_vw.per_day END,
        '|'
FROM nutrients n
     LEFT OUTER JOIN
        (SELECT np.*, p.portion_quantity
         FROM product_nutrients np, products p
         WHERE p.id = np.product_id) np_vw
       ON (n.id = np_vw.nutrient_id)
AND np_vw.product_id  IN (7207)
ORDER BY np_vw.product_id, n.id
