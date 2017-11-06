SELECT p.id,
   pc.challenge_id,
   pc.participant_id,
   c.organizer_id,
   c.challenge,
   c.description,
   c.rules,
   c.prizes,
   c.resources,
   c.tagline,
   p.name,
   p.email,
   p.last_sign_in_at,
   p.bio,
   p.github,
   p.linkedin,
   p.twitter
  FROM participants p,
   challenges c,
   ( SELECT c_1.id,
           c_1.id AS challenge_id,
           p_1.id AS participant_id
          FROM challenges c_1,
           participants p_1,
           submissions s_1
         WHERE s_1.challenge_id = c_1.id AND s_1.participant_id = p_1.id
       UNION
        SELECT c_1.id,
           c_1.id AS challenge_id,
           p_1.id AS participant_id
          FROM challenges c_1,
           participants p_1,
           topics t
         WHERE t.challenge_id = c_1.id AND t.participant_id = p_1.id
       UNION
        SELECT t.challenge_id AS id,
           t.challenge_id,
           ps.id AS participant_id
          FROM comments ps,
           topics t
         WHERE t.id = ps.topic_id
       UNION
        SELECT df.challenge_id AS id,
           df.challenge_id,
           dfd.participant_id
          FROM dataset_file_downloads dfd,
           dataset_files df
         WHERE dfd.dataset_file_id = df.id) pc
 WHERE pc.participant_id = p.id AND pc.challenge_id = c.id;
