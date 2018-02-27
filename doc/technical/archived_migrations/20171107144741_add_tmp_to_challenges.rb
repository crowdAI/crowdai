class AddTmpToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :tmp, :string
  end
end
