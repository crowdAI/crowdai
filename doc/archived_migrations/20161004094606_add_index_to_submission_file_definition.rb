class AddIndexToSubmissionFileDefinition < ActiveRecord::Migration
  def change
    add_column :submission_file_definitions, :submission_id, :integer
    add_index :submission_file_definitions, :submission_id
  end
end
