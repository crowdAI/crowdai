class ParticipantChallenge < SqlView
  belongs_to :challenge
  belongs_to :participant
end


# This view calculates which challenges a participant is connected with, based on:
# - submissions made
# - challenge forum topics entered
# - challenge forum posts entered
# - challenge data files downloaded

# For convenience, it also includes useful fields from the participants and challenges tables

=begin
SELECT p.id,
       pc.challenge_id,    -- fk to challenges
       pc.participant_id,  -- fk to participants
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
    (SELECT c_1.id,
            c_1.id AS challenge_id,   -- count submissions
            p.id AS participant_id
      FROM challenges c_1,
           participants p,
           submissions s_1
     WHERE s_1.challenge_id = c_1.id
       AND s_1.participant_id = p.id
    UNION
    SELECT c_1.id,
           c_1.id AS challenge_id,   -- count topics
           p.id AS participant_id
      FROM challenges c_1,
           participants p,
           topics t
     WHERE t.challenge_id = c_1.id
       AND t.participant_id = p.id
           OR (EXISTS    -- count any posts made
                (SELECT 'X'
                   FROM posts ps
                  WHERE ps.topic_id = t.id
                    AND ps.participant_id = p.id))
    UNION
    SELECT df.challenge_id AS id,
           df.challenge_id,
           dfd.participant_id
    FROM dataset_file_downloads dfd,
         dataset_files df
    WHERE dfd.dataset_file_id = df.id) pc
WHERE pc.participant_id = p.id
  AND pc.challenge_id = c.id
=end
