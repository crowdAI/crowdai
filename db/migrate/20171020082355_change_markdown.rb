class ChangeMarkdown < ActiveRecord::Migration[5.1]
  def change
    remove_column :job_postings, :description_markdown
  end
end
