class NewFields < ActiveRecord::Migration
  def change
    remove_column :posts, :votes
    add_column :submissions, :vote_count, :integer, default: 0
    add_column :challenges, :score_title, :string
    add_column :challenges, :score_secondary_title, :string
  end
end
