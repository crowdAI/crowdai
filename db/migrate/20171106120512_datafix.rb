class Datafix < ActiveRecord::Migration[5.1]
  def change
    execute "delete from votes where participant_id is null;"
    execute "delete from comments where participant_id is null;"
  end
end
