class AddArticleTypeCdToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :article_type_cd, :string
    add_column :articles, :notebook_url, :string
  end
end
