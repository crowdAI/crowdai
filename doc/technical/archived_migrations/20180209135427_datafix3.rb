class Datafix3 < ActiveRecord::Migration[5.1]
  def change
    execute "update challenges set private_challenge = false;"
  end
end
