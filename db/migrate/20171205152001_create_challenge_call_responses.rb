class CreateChallengeCallResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :challenge_call_responses do |t|
      t.references :challenge_call, foreign_key: true
      t.string :first_name
      t.string :family_name
      t.string :email
      t.string :phone
      t.string :organization
      t.text :description

      t.timestamps
    end
  end
end
