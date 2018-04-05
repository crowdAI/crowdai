class AddGraderIdentifierToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :grader_identifier, :string
  end
end
