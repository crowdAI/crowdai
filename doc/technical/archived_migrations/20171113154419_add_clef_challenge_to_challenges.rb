class AddClefChallengeToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :clef_challenge, :boolean, default: false
    execute "update challenges set clef_challenge = false;"
  end
end
