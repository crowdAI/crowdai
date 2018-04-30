class AddBodyMarkdownToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :body_markdown, :text
  end
end
