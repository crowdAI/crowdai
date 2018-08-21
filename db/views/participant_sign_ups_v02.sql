SELECT row_number() OVER () AS id,
count(id),
extract(MONTH FROM created_at)::INTEGER AS mnth,
extract(YEAR FROM created_at)::INTEGER AS yr
FROM participants
GROUP BY mnth, yr
ORDER BY 4,3
