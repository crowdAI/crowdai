class CreateParticipantSubmissions < ActiveRecord::Migration
  def change
    create_view :participant_submissions
  end
end
