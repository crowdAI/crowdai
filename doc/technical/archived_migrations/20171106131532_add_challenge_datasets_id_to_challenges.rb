class AddChallengeDatasetsIdToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :challenge_datasets_id, :integer
  end
end
