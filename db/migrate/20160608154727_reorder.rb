class Reorder < ActiveRecord::Migration
  def change

    execute "CREATE TABLE events_tmp2 AS SELECT id, challenge_id, event, seq, event_time, created_at, updated_at FROM events;"
    execute "drop table events;"
    execute "create table events2 as select * from events_tmp2;"


  end
end
