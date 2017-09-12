class RemovePaperclipFields < ActiveRecord::Migration
  def change
    remove_column :submission_files, :submission_file_file_name
    remove_column :submission_files, :submission_file_content_type
    remove_column :submission_files, :submission_file_file_size
    remove_column :submission_files, :submission_file_updated_at

  end
end
