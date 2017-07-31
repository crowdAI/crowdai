class AddFeaturedSequenceToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :featured_sequence, :integer, default: 0
    execute "update challenges set featured_sequence = 0;"
  end
end
