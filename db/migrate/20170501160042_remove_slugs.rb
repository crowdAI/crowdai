class RemoveSlugs < ActiveRecord::Migration[5.0]
  def change
    remove_column :dataset_file_downloads, :slug, :string
    remove_column :dataset_files, :slug, :string
    remove_column :images, :slug, :string
    remove_column :submission_files, :slug, :string
  end
end
