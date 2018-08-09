class FixParticipant < ActiveRecord::Migration[5.2]
  def change
    execute "update submissions set participant_id = 1 where participant_id is null;"
  end
end
