module SubmissionFilesHelper
  # TODO refactor see also sub_file_info
  def sub_file_info(file)
    "#{file.submission_file_file_name} (#{number_to_human_size(1024 * file.submission_file_file_size)})"
  end
end
