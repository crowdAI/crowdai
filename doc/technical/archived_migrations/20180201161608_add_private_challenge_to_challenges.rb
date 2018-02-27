class AddPrivateChallengeToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :private_challenge, :boolean, default: false
    execute "update challenges set private_challenge = NULL;"
  end
end
