class CorrectTimestamps < ActiveRecord::Migration[5.0]
  def change
    execute "UPDATE challenges SET start_date = date_trunc('day',start_dttm), start_time = '09:00', end_date = date_trunc('day',end_dttm), end_time = '17:00' WHERE Id <> 8;"
  end
end
