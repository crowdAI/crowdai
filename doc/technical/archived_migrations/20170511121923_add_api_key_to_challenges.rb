class AddApiKeyToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :api_key, :string
  end
end
