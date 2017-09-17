class AddViewCountToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :view_count, :integer, default: 0
    add_column :articles, :comment_count, :integer, default: 0
  end
end
