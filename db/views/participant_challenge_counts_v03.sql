SELECT ROW_NUMBER() OVER (),
       challenge_id,
       participant_id,
       registration_type
FROM   (SELECT DISTINCT challenge_id,
                        participant_id,
                        registration_type
        FROM   (SELECT s.challenge_id,
                       s.participant_id,
                       'submission' AS "registration_type"
                FROM   submissions s
                UNION
                SELECT s.votable_id,
                       s.participant_id,
                       'heart' AS "registration_type"
                FROM   votes s
                WHERE  s.votable_type = 'Challenge'
                UNION
                SELECT df.challenge_id,
                       dfd.participant_id,
                       'dataset_download'
                FROM   dataset_file_downloads dfd,
                       dataset_files df
                WHERE  dfd.dataset_file_id = df.id
                UNION
                SELECT c_1.id  AS challenge_id,
                       p_1.id  AS participant_id,
                       'forum' AS "registration_type"
                FROM   challenges c_1,
                       participants p_1,
                       topics t
                WHERE  t.challenge_id = c_1.id
                       AND t.participant_id = p_1.id
                UNION
                SELECT t.challenge_id,
                       ps.participant_id,
                       'forum' AS "registration_type"
                FROM   comments ps,
                       topics t
                WHERE  t.id = ps.topic_id) x
        ORDER  BY challenge_id,
                  participant_id) y 
