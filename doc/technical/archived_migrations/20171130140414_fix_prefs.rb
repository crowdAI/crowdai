class FixPrefs < ActiveRecord::Migration[5.1]
  def change
    execute "UPDATE email_preferences
SET receive_weekly_digest = TRUE
WHERE participant_id IN (
SELECT participant_id
FROM email_preferences
WHERE receive_every_email IS FALSE AND receive_daily_digest IS FALSE AND receive_weekly_digest IS FALSE
AND
(challenges_followed IS TRUE OR mentions IS true) );"
  end
end
