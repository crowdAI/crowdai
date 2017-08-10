class AddChallengeProposalToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :organizers, :challenge_proposal, :string
  end
end
