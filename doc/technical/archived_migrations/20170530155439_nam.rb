class Nam < ActiveRecord::Migration[5.0]
  def change
    execute "update challenges set challenge_client_name = slug;"
  end
end
