class Dataconv < ActiveRecord::Migration[5.1]
  def change
    execute "UPDATE challenges SET status_cd = 'draft',
                      start_dttm = '2017-11-17 09:00:00',
                      end_dttm = '2017-05-01 17:00:00',
                      start_date = '2017-11-17',
                      end_date = '2017-05-01',
                      start_time = '09:00:00',
                      end_time = '17:00:00'
            WHERE clef_task_id IS NOT null;"
    execute "UPDATE challenge_rounds SET active = TRUE  WHERE challenge_id IN (SELECT id FROM challenges WHERE clef_task_id IS NOT null);
"
  end
end
