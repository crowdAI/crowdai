class FixDates < ActiveRecord::Migration[5.0]
  def change
    execute "
    UPDATE challenges
SET start_dttm = (SELECT e.event_time
                  FROM events e
                  WHERE e.challenge_id = challenges.id
                    AND e.seq = (SELECT min(f.seq)
                                   FROM events f
                                  WHERE f.challenge_id = challenges.id));"
   execute "
UPDATE challenges
SET end_dttm = (SELECT e.event_time
                  FROM events e
                  WHERE e.challenge_id = challenges.id
                    AND e.seq = (SELECT max(f.seq)
                                   FROM events f
                                  WHERE f.challenge_id = challenges.id));"

  end
end
