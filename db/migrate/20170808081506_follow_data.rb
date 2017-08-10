class FollowData < ActiveRecord::Migration[5.0]
  def change
    execute "INSERT INTO follows (followable_id, followable_type, participant_id, created_at, updated_at)
SELECT challenge_id, 'Challenge', participant_id, current_date, CURRENT_DATE FROM participant_challenges
UNION
SELECT votable_id, 'Challenge', participant_id, current_date, CURRENT_DATE FROM votes WHERE votable_type = 'Challenge'
ORDER BY 1,2;
"
  end
end
