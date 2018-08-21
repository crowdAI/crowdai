SELECT
  ROW_NUMBER() OVER () AS Id,
  c.id AS challenge_id,
  c.challenge,
  r.id AS challenge_round_id,
  r.challenge_round,
  r.start_dttm,
  r.end_dttm,
  (r.end_dttm - r.start_dttm) AS duration,
  (SELECT count(s.id) FROM submissions s WHERE s.challenge_id = c.id) AS submissions,
  (SELECT count(p.id)
   FROM participants p
   WHERE p.id IN (SELECT s1.participant_id
                  FROM submissions s1
                  WHERE s1.challenge_id = c.id)) AS participants
FROM
  challenges c,
  challenge_rounds r
WHERE r.challenge_id = c.id
ORDER BY 1, 3
