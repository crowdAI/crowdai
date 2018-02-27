class SetClefChallenges < ActiveRecord::Migration[5.1]
  def change
    execute "update challenges set clef_challenge = true where organizer_id in (select id from organizers where clef_organizer is true);"
  end
end
