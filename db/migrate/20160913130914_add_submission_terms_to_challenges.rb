class AddSubmissionTermsToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :submission_license, :string
  end
end
