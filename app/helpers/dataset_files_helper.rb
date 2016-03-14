module DatasetFilesHelper
  def file_info(file)
    "#{file.dataset_file_file_name} (#{number_to_human_size(1024 * file.dataset_file_file_size)})"
  end
end
