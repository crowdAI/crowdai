class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :competition, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.boolean :evaluated
      t.float :score
      t.float :ranking
      t.string :submission_type_cd
      t.boolean :withdrawn
      t.date :withdrawn_date

      t.timestamps null: false
    end
  end
end
