class AddAttachmentFileAttachmentToFileAttachments < ActiveRecord::Migration
  def self.up
    change_table :file_attachments do |t|
      t.attachment :file_attachment
    end
  end

  def self.down
    remove_attachment :file_attachments, :file_attachment
  end
end
