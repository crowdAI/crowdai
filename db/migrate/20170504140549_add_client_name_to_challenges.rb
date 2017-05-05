class AddClientNameToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :client_name, :string
  end
end
