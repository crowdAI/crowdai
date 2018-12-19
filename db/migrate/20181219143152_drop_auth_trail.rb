class DropAuthTrail < ActiveRecord::Migration[5.2]
  def change
   execute "drop table login_activities;"
  end
end
