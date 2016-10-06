class AddDescriptionMarkdownToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :description_markdown, :text
  end
end
