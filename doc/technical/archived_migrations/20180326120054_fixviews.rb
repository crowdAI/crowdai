class Fixviews < ActiveRecord::Migration[5.1]
  def change
    #drop_view :leaderboards

    update_view :current_leaderboards, version: 3, revert_to_version: 2

    update_view :leaderboards, version: 20
  end
end
