class CreatePreviousOngoingLeaderboards < ActiveRecord::Migration[5.0]
  def change
    create_view :previous_ongoing_leaderboards, materialized: true
  end
end
