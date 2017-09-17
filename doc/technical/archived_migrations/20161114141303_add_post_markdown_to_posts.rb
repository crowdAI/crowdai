class AddPostMarkdownToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_markdown, :text
  end
end
