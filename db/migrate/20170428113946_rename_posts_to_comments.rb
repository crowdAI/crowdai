class RenamePostsToComments < ActiveRecord::Migration[5.0]
  def change
    execute "alter table posts rename to comments;"
    rename_column :comments, :post, :comment
    rename_column :comments, :post_markdown, :comment_markdown
  end
end
