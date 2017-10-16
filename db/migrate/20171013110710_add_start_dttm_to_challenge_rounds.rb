class AddStartDttmToChallengeRounds < ActiveRecord::Migration[5.1]
  def change
    add_column :challenge_rounds, :start_dttm, :datetime
    add_column :challenge_rounds, :end_dttm, :datetime
  end
end
