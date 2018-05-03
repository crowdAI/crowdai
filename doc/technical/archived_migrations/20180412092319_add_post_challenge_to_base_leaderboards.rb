class AddPostChallengeToBaseLeaderboards < ActiveRecord::Migration[5.1]
  def change
    add_column :base_leaderboards, :post_challenge, :boolean, default: false
  end
end
