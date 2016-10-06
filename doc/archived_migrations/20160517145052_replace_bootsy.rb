class ReplaceBootsy < ActiveRecord::Migration
  def change
    add_column :challenges, :description_markdown, :text
    add_column :challenges, :description_rendered, :text

    add_column :challenges, :rules_markdown, :text
    add_column :challenges, :rules_rendered, :text

    add_column :challenges, :prizes_markdown, :text
    add_column :challenges, :prizes_rendered, :text

    add_column :challenges, :resources_markdown, :text
    add_column :challenges, :resources_rendered, :text

    add_column :challenges, :dataset_description_markdown, :text
    add_column :challenges, :dataset_description_rendered, :text

    add_column :challenges, :submission_instructions_markdown, :text
    add_column :challenges, :submission_instructions_rendered, :text
  end
end
