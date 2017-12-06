SELECT
  l.id,
  ROW_NUMBER() OVER (PARTITION by l.challenge_id,
                                  l.challenge_round_id
                    ORDER BY
                      CASE WHEN c.primary_sort_order_cd = 'ascending'
                           THEN l.score END ASC,
                      CASE WHEN c.primary_sort_order_cd = 'descending'
                           THEN l.score END DESC ) AS ROW_NUM,
  l.id AS submission_id,
  l.challenge_id,
  l.challenge_round_id,
  l.participant_id,
  l.slug,
  c.organizer_id,
  l.name,
  l.entries,
  l.score,
  l.score_secondary,
  l.media_large,
  l.media_thumbnail,
  l.media_content_type,
  l.description,
  l.description_markdown,
  l.created_at,
  l.updated_at
FROM (SELECT
        row_number() OVER (PARTITION BY s.challenge_id, s.challenge_round_id, s.participant_id
                           ORDER BY
                             CASE WHEN c.primary_sort_order_cd = 'ascending'
                                  THEN s.score END ASC,
                             CASE WHEN c.primary_sort_order_cd = 'descending'
                                  THEN s.score END DESC) AS submission_ranking,
        s.id,
        s.challenge_id,
        s.challenge_round_id,
        s.participant_id,
        p.slug,
        p.name,
        cnt.entries,
        s.score,
        s.score_secondary,
        s.media_large,
        s.media_thumbnail,
        s.media_content_type,
        s.description,
        s.description_markdown,
        s.created_at,
        s.updated_at
      FROM submissions s,
           challenges c,
           participants p,
            ( SELECT c_1.challenge_id,
                     c_1.challenge_round_id,
                     c_1.participant_id,
                     count(c_1.*) AS entries
              FROM submissions c_1
              WHERE c_1.post_challenge = FALSE
              GROUP BY c_1.challenge_id, c_1.challenge_round_id, c_1.participant_id) cnt
      WHERE p.id = s.participant_id
        AND s.challenge_id = c.id
        AND s.grading_status_cd::text = 'graded'::text
        AND cnt.challenge_id = s.challenge_id
        AND cnt.challenge_round_id = s.challenge_round_id
        AND cnt.participant_id = s.participant_id) l,
    challenges c
  WHERE l.submission_ranking = 1 AND c.id = l.challenge_id
  ORDER BY l.challenge_id, row_num;
