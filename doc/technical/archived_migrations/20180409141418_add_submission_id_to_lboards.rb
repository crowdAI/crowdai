class AddSubmissionIdToLboards < ActiveRecord::Migration[5.1]
  def change
    add_column :lboards, :submission_id, :integer
  end
end
