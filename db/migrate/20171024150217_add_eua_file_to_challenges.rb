class AddEuaFileToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :eua_file, :string
  end
end
