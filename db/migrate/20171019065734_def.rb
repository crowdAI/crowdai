class Def < ActiveRecord::Migration[5.1]
  def change
    change_column :submission_comments, :vote_count, :integer, default: 0
  end
end
