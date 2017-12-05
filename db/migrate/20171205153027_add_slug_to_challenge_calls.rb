class AddSlugToChallengeCalls < ActiveRecord::Migration[5.1]
  def change
    add_column :challenge_calls, :slug, :string
  end
end
