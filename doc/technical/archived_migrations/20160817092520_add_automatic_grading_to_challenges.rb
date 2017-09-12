class AddAutomaticGradingToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :automatic_grading, :boolean, default: false
  end
end
