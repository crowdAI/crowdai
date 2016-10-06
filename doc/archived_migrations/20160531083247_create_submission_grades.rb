class CreateSubmissionGrades < ActiveRecord::Migration
  def change
    create_table :submission_grades do |t|
      t.references :submission, index: true, foreign_key: true
      t.string :grading_status_cd
      t.string :grading_message
      t.float :grading_factor
      t.float :score
      t.float :score_secondary
      t.timestamps null: false
    end

    drop_table :bootsy_image_galleries
    drop_table :bootsy_images
  end
end
