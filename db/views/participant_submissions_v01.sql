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
  submissions s,
  participants p,
  submission_files f
WHERE
  s.participant_id = p.id
  AND f.submission_id = s.id
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
