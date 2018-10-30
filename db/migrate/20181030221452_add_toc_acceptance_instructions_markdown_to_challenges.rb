class AddTocAcceptanceInstructionsMarkdownToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :toc_acceptance_instructions_markdown, :text
  end
end
