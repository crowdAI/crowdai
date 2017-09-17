class AddApiRequiredToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :api_required, :boolean, default: false
    add_column :challenges, :framework_required, :boolean, default: false
  end
end
