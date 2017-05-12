SELECT l.row_num,
   l.id as "submission_id",
   l.challenge_id,
   l.participant_id,
   l.name,
   l.entries,
   l.score,
   l.score_secondary,
   l.media_large,
   l.media_thumbnail,
   l.media_content_type,
   l.created_at,
   l.updated_at
  FROM ( SELECT row_number() OVER (PARTITION BY s.challenge_id, s.participant_id ORDER BY s.score DESC, s.score_secondary) AS row_num,
           s.id,
           s.challenge_id,
           s.participant_id,
           p.name,
           cnt.entries,
           s.score,
           s.score_secondary,
           s.media_large,
           s.media_thumbnail,
           s.media_content_type,
           s.created_at,
           s.updated_at
          FROM submissions s,
           participants p,
           ( SELECT c.challenge_id,
                   c.participant_id,
                   count(c.*) AS entries
                  FROM submissions c
                 WHERE c.post_challenge = false
                 GROUP BY c.challenge_id, c.participant_id) cnt
         WHERE p.id = s.participant_id AND s.grading_status_cd::text = 'graded'::text AND cnt.challenge_id = s.challenge_id AND cnt.participant_id = s.participant_id) l
 WHERE l.row_num = 1
 ORDER BY l.score DESC, l.score_secondary;
