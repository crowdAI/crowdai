class CreateSubmissionFileDefinitions < ActiveRecord::Migration
  def change
    create_table :submission_file_definitions do |t|
      t.references :challenge, index: true, foreign_key: true
      t.integer :seq
      t.string :submission_file_description
      t.string :filetype_cd
      t.boolean :file_required, default: false
      t.text :submission_file_help_text

      t.timestamps null: false
    end
  end
end
