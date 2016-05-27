class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
      t.references :participant, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_column :posts, :vote_count, :integer, default: 0
  end
end
