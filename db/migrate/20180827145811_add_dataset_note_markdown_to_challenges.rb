class AddDatasetNoteMarkdownToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :dataset_note_markdown, :text
    add_column :challenges, :dataset_note, :text
  end
end
