class AddPageViewsToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :page_views, :integer, default: 0
  end
end
