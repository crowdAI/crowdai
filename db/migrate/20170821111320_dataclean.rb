class Dataclean < ActiveRecord::Migration[5.0]
  def change
    execute "UPDATE submissions
SET description = null, description_markdown = NULL
WHERE description LIKE '<p>Submitted externally.</p>%'
OR description LIKE '<p>#placeholder</p>%'
OR description LIKE '<h1 id=\"placeholder\">placeholder</h1>%';"
  end
end
