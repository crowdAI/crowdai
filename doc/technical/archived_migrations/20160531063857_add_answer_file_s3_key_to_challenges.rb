class AddAnswerFileS3KeyToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :answer_file_s3_key, :string
  end
end
