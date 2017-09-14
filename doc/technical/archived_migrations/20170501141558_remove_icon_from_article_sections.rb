class RemoveIconFromArticleSections < ActiveRecord::Migration[5.0]
  def change
    remove_column :article_sections, :icon, :string
  end
end
