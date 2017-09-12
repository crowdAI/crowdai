class AddIconToArticleSections < ActiveRecord::Migration
  def change
    add_column :article_sections, :icon, :string
  end
end
