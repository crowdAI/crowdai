class CreateUserCompetitions < ActiveRecord::Migration
  def change
    create_table :user_competitions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :competition, index: true, foreign_key: true
      t.boolean :rules_accepted

      t.timestamps null: false
    end
  end
end
