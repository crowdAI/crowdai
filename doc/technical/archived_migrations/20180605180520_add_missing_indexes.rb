class AddMissingIndexes < ActiveRecord::Migration[5.2]
  def change
       add_index :follows, [:followable_id, :followable_type]
       add_index :submissions, :challenge_round_id
       add_index :votes, [:votable_id, :votable_type]
  end
end
