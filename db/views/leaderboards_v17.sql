SELECT
  c.id,
  c.ROW_NUM,
  (SELECT p1.row_num
     FROM previous_leaderboards p1
     WHERE p1.participant_id = c.participant_id
       AND p1.challenge_id = c.challenge_id
       AND p1.challenge_round_id = c.challenge_round_id) AS previous_row_num,
  c.id AS submission_id,
  c.challenge_id,
  c.challenge_round_id,
  c.participant_id,
  c.slug,
  c.organizer_id,
  c.name,
  c.entries,
  c.score,
  c.score_secondary,
  c.media_large,
  c.media_thumbnail,
  c.media_content_type,
  c.description,
  c.description_markdown,
  c.created_at,
  c.updated_at
FROM current_leaderboards c
