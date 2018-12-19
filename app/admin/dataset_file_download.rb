ActiveAdmin.register DatasetFileDownload do
  belongs_to :dataset_file
  navigation_menu :dataset_file

  controller do
    def permitted_params
      params.permit!
    end
  end

end
