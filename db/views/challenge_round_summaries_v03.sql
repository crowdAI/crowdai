SELECT
  cr.id,
  cr.challenge_round,
  cr.row_num AS row_num,
  acr.row_num AS active_row_num,
  CASE WHEN (cr.row_num < acr.row_num) THEN 'history'
    WHEN cr.row_num = acr.row_num THEN 'current'
    WHEN cr.row_num > acr.row_num THEN 'future'
  END AS round_status_cd,
  cr.active,
  cr.challenge_id,
  cr.START_dttm,
  cr.end_dttm,
  cr.submission_limit,
  cr.submission_limit_period_cd,
  cr.minimum_score,
  cr.minimum_score_secondary,
  c.status_cd
FROM challenge_round_views cr,
     challenge_round_views acr,
     challenges c
WHERE c.id = cr.challenge_id
  AND c.id = acr.challenge_id
  AND acr.active IS TRUE
