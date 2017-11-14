class AddStatusCdToParticipantClefTask < ActiveRecord::Migration[5.1]
  def change
    add_column :participant_clef_tasks, :status_cd, :string
  end
end
