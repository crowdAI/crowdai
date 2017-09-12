class CreateLeaderboardSqlView < ActiveRecord::Migration
  def change
    #drop_view :leaderboards
    create_view :leaderboards,
    "
    SELECT s.id, s.competition_id, s.user_id, u.name, NULL AS team_id, s.score, cnt.entries, s.created_at, s.updated_at
    FROM submissions s,
         users u,
        (SELECT competition_id,
                user_id,
                team_id,
                count(*) AS entries
          FROM submissions
        GROUP BY competition_id, user_id, team_id) cnt
    WHERE u.id = s.user_id
    AND s.evaluated = TRUE
    AND s.user_id = cnt.user_id
    AND s.competition_id = cnt.competition_id
    AND s.score = (SELECT max(m.score)
                     FROM submissions m
                   WHERE m.competition_id = s.competition_id
                     AND m.user_id = s.user_id
                     AND m.evaluated = TRUE)
    "
  end
end
