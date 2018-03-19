class DropDoorkeeperTables < ActiveRecord::Migration[5.1]
  def change
    execute "drop table oauth_access_grants;"
    execute "drop table oauth_access_tokens;"
    execute "drop table oauth_applications;"
  end
end
