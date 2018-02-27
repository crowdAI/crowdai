class UpdateChallengeRoundViewsToVersion2 < ActiveRecord::Migration[5.0]
  def change
    drop_view :challenge_round_summaries
    update_view :challenge_round_views, version: 2, revert_to_version: 1
    create_view :challenge_round_summaries, version: 2
  end
end
