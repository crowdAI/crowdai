class CreateChallengeCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :challenge_calls do |t|
      t.string :title
      t.string :website
      t.boolean :active, default: false
      t.datetime :closing_date
      t.text :description

      t.timestamps
    end
  end
end
