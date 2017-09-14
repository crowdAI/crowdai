class Renameclient < ActiveRecord::Migration[5.0]
  def change
    rename_column :challenges, :client_name, :challenge_client_name
  end
end
