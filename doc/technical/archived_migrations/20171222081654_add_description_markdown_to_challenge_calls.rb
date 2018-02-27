class AddDescriptionMarkdownToChallengeCalls < ActiveRecord::Migration[5.1]
  def change
    add_column :challenge_calls, :description_markdown, :text
  end
end
