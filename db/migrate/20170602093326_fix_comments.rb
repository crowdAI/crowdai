class FixComments < ActiveRecord::Migration[5.0]
  def change
    execute "delete from comments;"
    execute "insert into comments select * from posts;"
    remove_column :topics, :description
    remove_column :topics, :description_markdown
  end
end
