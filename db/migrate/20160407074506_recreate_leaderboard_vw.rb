class RecreateLeaderboardVw < ActiveRecord::Migration
  def change
    create_view :leaderboards,
    "
    SELECT s.id,
           s.challenge_id,
           s.user_id,
           u.name,
           NULL::int AS team_id,
           s.score,
           cnt.entries,
           s.created_at,
           s.updated_at
    FROM   submissions s,
           users u,
           (SELECT submissions.challenge_id,
                   submissions.user_id,
                   submissions.team_id,
                   count(*) AS entries
            FROM   submissions
            GROUP  BY submissions.challenge_id,
                      submissions.user_id,
                      submissions.team_id) cnt
    WHERE  ( ( u.id = s.user_id )
             AND ( s.evaluated = TRUE )
             AND ( s.user_id = cnt.user_id )
             AND ( s.challenge_id = cnt.challenge_id )
             AND ( s.score = (SELECT Max(m.score) AS MAX
                              FROM   submissions m
                              WHERE  ( ( m.challenge_id = s.challenge_id )
                                       AND ( m.user_id = s.user_id )
                                       AND ( m.evaluated = TRUE ) )) ) )
    "
  end
end
