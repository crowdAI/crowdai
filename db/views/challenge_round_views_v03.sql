SELECT
   cr.id,
   cr.challenge_round,
   cr.row_num,
   cr.active,
   cr.challenge_id,
   cr.START_dttm,
   cr.end_dttm,
   cr.submission_limit,
   cr.submission_limit_period_cd,
   cr.failed_submissions,
   cr.minimum_score,
   cr.minimum_score_secondary
FROM (
  SELECT
    r1.*,
    row_number()
    OVER (PARTITION BY
            r1.challenge_id
          ORDER BY
            r1.challenge_id,
            r1.start_dttm) AS row_num
    FROM
      challenge_rounds r1) cr
