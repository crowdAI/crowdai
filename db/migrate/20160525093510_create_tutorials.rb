class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :article
      t.string :url
      t.references :participant, index: true, foreign_key: true
      t.string :status_cd
      t.integer :vote_count

      t.timestamps null: false
    end
  end
end
