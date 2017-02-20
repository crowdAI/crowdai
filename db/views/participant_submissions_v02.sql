SELECT
  s.id,
  s.challenge_id,
  s.participant_id,
  p.name,
  s.grading_status_cd,
  s.post_challenge,
  s.score,
  s.score_secondary,
  count(f.*) AS files,
  s.created_at
FROM
  participants p,
  submissions s LEFT OUTER JOIN
  submission_files f ON f.submission_id = s.id
WHERE
  s.participant_id = p.id
GROUP BY s.id,
  s.challenge_id,
  s.participant_id,
  p.name,
  s.grading_status_cd,
  s.post_challenge,
  s.score,
  s.score_secondary,
  s.created_at
ORDER BY s.created_at desc
