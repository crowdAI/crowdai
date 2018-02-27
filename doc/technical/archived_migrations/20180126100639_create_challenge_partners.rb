class CreateChallengePartners < ActiveRecord::Migration[5.1]
  def change
    create_table :challenge_partners do |t|
      t.references :challenge, foreign_key: true
      t.string :image_file
      t.string :partner_url

      t.timestamps
    end
  end
end
