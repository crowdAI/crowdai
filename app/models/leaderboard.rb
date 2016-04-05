class Leaderboard < SqlView
  belongs_to :competition
  belongs_to :user

  default_scope { order('score DESC') }
end


=begin
SELECT s.id,
       s.competition_id,
       s.user_id,
       u.name,
       NULL :: unknown AS team_id,
       s.score,
       cnt.entries,
       s.created_at,
       s.updated_at
FROM   submissions s,
       users u,
       (SELECT submissions.competition_id,
               submissions.user_id,
               submissions.team_id,
               Count(*) AS entries
        FROM   submissions
        GROUP  BY submissions.competition_id,
                  submissions.user_id,
                  submissions.team_id) cnt
WHERE  ( ( u.id = s.user_id )
         AND ( s.evaluated = TRUE )
         AND ( s.user_id = cnt.user_id )
         AND ( s.competition_id = cnt.competition_id )
         AND ( s.score = (SELECT Max(m.score) AS MAX
                          FROM   submissions m
                          WHERE  ( ( m.competition_id = s.competition_id )
                                   AND ( m.user_id = s.user_id )
                                   AND ( m.evaluated = TRUE ) )) ) );
=end
