SELECT
  l.id,
  ROW_NUMBER() OVER (PARTITION by l.challenge_id,
                                  l.challenge_round_id
                    ORDER BY
                      CASE WHEN c.primary_sort_order_cd = 'ascending'
                        THEN l.score END ASC,
                      CASE WHEN c.primary_sort_order_cd = 'descending'
                        THEN l.score END DESC,
                      CASE WHEN c.secondary_sort_order_cd = 'ascending'
                        THEN l.score_secondary END ASC,
                      CASE WHEN c.secondary_sort_order_cd = 'descending'
                        THEN l.score_secondary END DESC ) AS ROW_NUM,
  l.id AS submission_id,
  l.challenge_id,
  l.challenge_round_id,
  l.participant_id,
  l.score,
  l.score_secondary,
  l.created_at,
  l.updated_at
FROM (SELECT
        row_number() OVER (PARTITION BY s.challenge_id, s.challenge_round_id, s.participant_id
                           ORDER BY
                             CASE WHEN c.primary_sort_order_cd = 'ascending'
                                  THEN s.score END ASC,
                             CASE WHEN c.primary_sort_order_cd = 'descending'
                                  THEN s.score END DESC,
                             CASE WHEN c.secondary_sort_order_cd = 'ascending'
                                  THEN s.score_secondary END ASC,
                             CASE WHEN c.secondary_sort_order_cd = 'descending'
                                  THEN s.score_secondary END DESC) AS submission_ranking,
        s.id,
        s.challenge_id,
        s.challenge_round_id,
        s.participant_id,
        s.score,
        s.score_secondary,
        s.created_at,
        s.updated_at
      FROM submissions s,
           challenges c,
           participants p
      WHERE p.id = s.participant_id
        AND s.challenge_id = c.id
        AND s.grading_status_cd::text = 'graded'::text
        AND s.post_challenge IN (FALSE)
        AND s.created_at <= (SELECT m.created_at - (c.ranking_window || ' HOUR')::INTERVAL
                               FROM submissions m
                              WHERE m.challenge_id = c.id
                              ORDER BY m.created_at DESC LIMIT 1)) l,
    challenges c
  WHERE l.submission_ranking = 1
    AND c.id = l.challenge_id
  ORDER BY l.challenge_id, l.challenge_round_id, row_num
