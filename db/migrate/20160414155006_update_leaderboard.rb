class UpdateLeaderboard < ActiveRecord::Migration
  def change
      drop_view :leaderboards
      create_view :leaderboards,
      "
      SELECT s.id,
        s.challenge_id,
 s.participant_id,
 p.name,
 NULL::INTEGER AS team_id,
 s.score,
 s.score_secondary,
 cnt.entries,
 s.created_at,
 s.updated_at
FROM submissions s,
   participants p,
   (SELECT e.challenge_id,
           e.participant_id,
           COUNT(e.*) AS entries
    FROM submissions e
    GROUP BY e.challenge_id, e.participant_id) cnt
WHERE p.id = s.participant_id
AND s.evaluated = TRUE
AND cnt.challenge_id = s.challenge_id
AND cnt.participant_id = s.participant_id
ORDER BY s.score desc, s.score_secondary
      "
  end
end
