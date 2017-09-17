class AddThresholdToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :threshold, :float
  end
end
