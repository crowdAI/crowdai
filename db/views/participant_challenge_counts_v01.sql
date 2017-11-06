select distinct challenge_id, participant_id from (
SELECT s.challenge_id, s.participant_id
  FROM submissions s
UNION
SELECT s.votable_id, s.participant_id
  FROM votes s
  WHERE s.votable_type = 'Challenge'
UNION
 SELECT df.challenge_id, dfd.participant_id
   FROM dataset_file_downloads dfd,
        dataset_files df
  WHERE dfd.dataset_file_id = df.id
UNION
  SELECT c_1.id AS challenge_id,
         p_1.id AS participant_id
    FROM challenges c_1,
         participants p_1,
         topics t
   WHERE t.challenge_id = c_1.id
     AND t.participant_id = p_1.id
UNION
  SELECT t.challenge_id,
         ps.participant_id
    FROM comments ps,
         topics t
   WHERE t.id = ps.topic_id ) x
