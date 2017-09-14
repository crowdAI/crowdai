class UpdateParticipantSubmissionsToVersion2 < ActiveRecord::Migration
  def change
    update_view :participant_submissions, version: 2, revert_to_version: 1
  end
end
