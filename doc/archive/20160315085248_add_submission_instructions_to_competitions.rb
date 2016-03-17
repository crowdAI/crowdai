class AddSubmissionInstructionsToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :submission_instructions, :text
  end
end
