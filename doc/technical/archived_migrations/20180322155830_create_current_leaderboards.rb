class CreateCurrentLeaderboards < ActiveRecord::Migration[5.0]
  def change
    create_view :current_leaderboards
  end
end
