class RemoveCommentCountFromArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :comment_count, :integer
  end
end
