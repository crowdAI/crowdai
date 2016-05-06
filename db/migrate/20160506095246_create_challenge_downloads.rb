class CreateChallengeDownloads < ActiveRecord::Migration
  def change
    create_table :challenge_downloads do |t|
      t.references :challenge, index: true, foreign_key: true
      t.references :participant, index: true, foreign_key: true
      t.references :dataset_file, index: true, foreign_key: true
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
