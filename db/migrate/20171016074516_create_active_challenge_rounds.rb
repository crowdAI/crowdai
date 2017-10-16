class CreateActiveChallengeRounds < ActiveRecord::Migration[5.0]
  def change
    create_view :challenge_round_views
    create_view :challenge_round_summaries
  end
end
