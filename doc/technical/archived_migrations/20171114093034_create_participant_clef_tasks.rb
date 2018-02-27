class CreateParticipantClefTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :participant_clef_tasks do |t|
      t.references :participant, foreign_key: true
      t.references :clef_task, foreign_key: true
      t.boolean :approved
      t.string :eua_file

      t.timestamps
    end
  end
end
