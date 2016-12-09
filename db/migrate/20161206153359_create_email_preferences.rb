class CreateEmailPreferences < ActiveRecord::Migration
  def change
    create_table :email_preferences do |t|
      t.references :participant, index: true, foreign_key: true
      t.boolean :opt_out_all, default: false
      t.boolean :newsletter, default: true
      t.boolean :leaderboard_entry, default: true
      t.boolean :any_post, default: true
      t.boolean :my_topic_post, default: true
      t.boolean :new_leader, default: true

      t.timestamps null: false
    end
  end


end
