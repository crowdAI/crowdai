class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :model_id
      t.string :mailer
      t.text :recipients
      t.text :options
      t.string :status_cd

      t.timestamps null: false
    end
  end
end
