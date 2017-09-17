class AddSectionToArticleSections < ActiveRecord::Migration
  def change
    add_column :article_sections, :section, :string
  end
end
