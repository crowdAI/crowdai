class RemoveTeams < ActiveRecord::Migration
  def change
    drop_view :leaderboards
    drop_table :team_participants
    remove_column :submissions, :team_id
    drop_table :teams
    create_view :leaderboards,
    "
    SELECT * FROM (
        SELECT ROW_NUMBER() OVER (PARTITION by s.challenge_id, s.participant_id
                              ORDER BY s.score desc,
                                       s.score_secondary) AS row_num,
                s.id,
                s.challenge_id,
                s.participant_id,
                p.name,
                cnt.entries,
                s.score,
                s.score_secondary,
                s.created_at,
                s.updated_at
          FROM submissions s,
               participants p,
               (SELECT c.challenge_id,
                       c.participant_id,
                       COUNT(c.*) AS entries
                  FROM submissions c
              GROUP BY c.challenge_id, c.participant_id) cnt
         WHERE p.id = s.participant_id
           AND s.evaluated = TRUE
           AND cnt.challenge_id = s.challenge_id
           AND cnt.participant_id = s.participant_id ) l
    WHERE l.ROW_num = 1
    ORDER BY l.score desc, l.score_secondary
    "
  end
end
