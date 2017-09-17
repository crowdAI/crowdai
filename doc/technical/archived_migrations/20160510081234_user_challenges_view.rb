class UserChallengesView < ActiveRecord::Migration
  def change
    create_view :participant_challenges,
    "
    SELECT c.id,
           c.id AS challenge_id,
           p.id AS participant_id,
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
    FROM challenges c,
         participants p,
         submissions s
    WHERE s.challenge_id = c.id
      AND s.participant_id = p.id
    UNION
    SELECT c.id,
           c.id AS challenge_id,
           p.id AS participant_id,
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
    FROM challenges c,
         participants p,
         topics t
    WHERE t.challenge_id = c.id
      AND (t.participant_id = p.id
            OR EXISTS(SELECT 'X'
                        FROM posts ps
                        WHERE ps.topic_id = t.id
                         AND ps.participant_id = p.id))

    "
  end
end
