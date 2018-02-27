class DataCleanse < ActiveRecord::Migration[5.1]
  def change
    execute "update challenges set end_dttm = '2017-12-01 17:00:00' where id = 11;"
    execute "update submissions set post_challenge = 'f' where challenge_id = 11;"
  end
end
