class RemoveTrackable < ActiveRecord::Migration[5.2]
  def change
    drop_view :participant_challenges
    remove_columns :participants, :sign_in_count
    remove_columns :participants, :current_sign_in_at
    remove_columns :participants, :last_sign_in_at
    remove_columns :participants, :last_sign_in_ip
    remove_columns :participants, :current_sign_in_ip
    create_view :participant_challenges, version: 7
  end
end
