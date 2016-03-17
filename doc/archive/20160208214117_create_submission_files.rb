class CreateSubmissionFiles < ActiveRecord::Migration
  def change
    create_table :submission_files do |t|
      t.references :submission, index: true, foreign_key: true
      t.integer :seq
      t.string :filename
      t.string :filetype

      t.timestamps null: false
    end
  end
end
