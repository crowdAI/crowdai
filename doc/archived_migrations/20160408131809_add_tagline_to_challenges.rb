class AddTaglineToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :tagline, :string
  end
end
