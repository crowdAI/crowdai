class CreateBadgeStats < ActiveRecord::Migration[5.2]
  def change
    create_view :badge_stats
  end
end
