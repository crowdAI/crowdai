class AddAttachmentSubmissionFileToSubmissionFiles < ActiveRecord::Migration
  def self.up
    change_table :submission_files do |t|
      t.attachment :submission_file
    end
  end

  def self.down
    remove_attachment :submission_files, :submission_file
  end
end
