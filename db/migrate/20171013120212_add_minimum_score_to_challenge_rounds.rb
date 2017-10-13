class AddMinimumScoreToChallengeRounds < ActiveRecord::Migration[5.1]
  def change
    add_column :challenge_rounds, :minimum_score, :float
    add_column :challenge_rounds, :minimum_score_secondary, :float
  end
end
