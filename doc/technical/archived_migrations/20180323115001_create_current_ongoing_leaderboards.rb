class CreateCurrentOngoingLeaderboards < ActiveRecord::Migration[5.0]
  def change
    create_view :current_ongoing_leaderboards
  end
end
