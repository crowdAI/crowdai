class CreateChallengeParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :challenge_participants do |t|
      t.references :challenge, foreign_key: true
      t.references :participant, foreign_key: true
      t.string :email
      t.string :name
      t.boolean :registered, default: false
      t.boolean :accepted_dataset_toc, default: false
      t.integer :clef_task_id
      t.string :clef_eua_file
      t.boolean :clef_approved, default: false
      t.string :clef_status_cd

      t.timestamps
    end
  end
end
