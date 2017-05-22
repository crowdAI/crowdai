ActiveAdmin.register DatasetFileDownload do
  belongs_to :dataset_file
  navigation_menu :dataset_file
end
