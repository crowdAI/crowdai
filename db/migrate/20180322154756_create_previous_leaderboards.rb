class CreatePreviousLeaderboards < ActiveRecord::Migration[5.0]
  def change
    create_view :previous_leaderboards, materialized: true
  end
end
