class AddPerpetualChallengeToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :perpetual_challenge, :boolean, default: false
  end
end
