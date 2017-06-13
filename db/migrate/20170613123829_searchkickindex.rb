class Searchkickindex < ActiveRecord::Migration[5.0]
  def change
    Challenge.reindex
    Article.reindex
    Comment.reindex
  end
end
