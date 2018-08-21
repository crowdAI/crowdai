class CreateChallengeStats < ActiveRecord::Migration[5.2]
  def change
    create_view :challenge_stats
  end
end
