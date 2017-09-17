class DropPosts < ActiveRecord::Migration[5.0]
  def change
    execute "drop table posts;"
  end
end
