class RenameChallengeDownloads < ActiveRecord::Migration
  def change
    rename_table :challenge_downloads, :dataset_file_downloads
    remove_column :dataset_file_downloads, :challenge_id
  end
end
