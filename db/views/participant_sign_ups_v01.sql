SELECT count(id), extract(MONTH FROM created_at)::INTEGER AS mnth, extract(YEAR FROM created_at)::INTEGER AS yr FROM participants
GROUP BY mnth, yr
ORDER BY 3,2
