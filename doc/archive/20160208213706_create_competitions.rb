class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.references :hosting_institution, index: true, foreign_key: true
      t.string :competition
      t.date :start_date
      t.date :end_date
      t.string :status_cd
      t.text :description
      t.text :evaluation
      t.text :evaluation_criteria
      t.text :rules
      t.text :prizes
      t.text :resources

      t.timestamps null: false
    end
  end
end
