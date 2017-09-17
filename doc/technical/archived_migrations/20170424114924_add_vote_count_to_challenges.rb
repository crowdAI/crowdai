class AddVoteCountToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :vote_count, :integer, default: 0
  end
end
