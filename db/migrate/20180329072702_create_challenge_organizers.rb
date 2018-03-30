class CreateChallengeOrganizers < ActiveRecord::Migration[5.1]
  def change
    create_table :challenge_organizers do |t|
      t.references :challenge, foreign_key: true
      t.references :organizer, foreign_key: true
      t.integer :seq

      t.timestamps
    end
  end
end
