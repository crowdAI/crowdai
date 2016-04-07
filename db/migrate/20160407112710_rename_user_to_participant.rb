class RenameUserToParticipant < ActiveRecord::Migration
  def change
    drop_view :leaderboards
    rename_table :users, :participants
    rename_table :team_users, :team_participants
    rename_column :team_participants, :user_id, :participant_id

    rename_table :user_challenges, :participant_challenges
    rename_column :participant_challenges, :user_id, :participant_id

    rename_column :posts, :user_id, :participant_id
    rename_column :submissions, :user_id, :participant_id
    rename_column :topics, :user_id, :participant_id



    create_view :leaderboards, "
    SELECT s.id,
       s.challenge_id,
       s.participant_id,
       p.name,
       NULL::INTEGER AS team_id,
       s.score,
       cnt.entries,
       s.created_at,
       s.updated_at
      FROM submissions s,
       participants p,
       ( SELECT submissions.challenge_id,
                submissions.participant_id,
                submissions.team_id,
                count(*) AS entries
          FROM submissions
          GROUP BY submissions.challenge_id,
                   submissions.participant_id,
                   submissions.team_id) cnt
     WHERE ((p.id = s.participant_id)
            AND (s.evaluated = true)
            AND (s.participant_id = cnt.participant_id)
            AND (s.challenge_id = cnt.challenge_id)
            AND (s.score = ( SELECT max(m.score) AS MAX
                            FROM submissions m
                            WHERE ((m.challenge_id = s.challenge_id)
                            AND (m.participant_id = s.participant_id)
                            AND (m.evaluated = true)))))
    "
  end
end
