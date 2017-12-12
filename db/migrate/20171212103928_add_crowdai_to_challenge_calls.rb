class AddCrowdaiToChallengeCalls < ActiveRecord::Migration[5.1]
  def change
    add_column :challenge_calls, :crowdai, :boolean, default: false
  end
end
