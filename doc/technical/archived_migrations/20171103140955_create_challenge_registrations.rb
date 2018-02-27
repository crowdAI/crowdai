class CreateChallengeRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :challenge_registrations do |t|
      t.references :challenge, foreign_key: true
      t.references :participant, foreign_key: true
      t.string :status_cd
      t.string :eua_file
      t.string :reject_message

      t.timestamps
    end
  end
end
