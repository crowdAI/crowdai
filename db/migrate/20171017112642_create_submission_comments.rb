class CreateSubmissionComments < ActiveRecord::Migration[5.1]
  def change
    create_table :submission_comments do |t|
      t.references :submission, foreign_key: true
      t.references :participant, foreign_key: true
      t.text :comment_markdown
      t.text :comment
      t.integer :vote_count

      t.timestamps
    end
  end
end
