class UpdateChallengeRoundViewsToVersion3 < ActiveRecord::Migration[5.2]
  def change
    drop_view :challenge_round_summaries
    drop_view :challenge_round_views
    create_view :challenge_round_views, version: 3
    create_view :challenge_round_summaries, version: 4
  end
end
