ActiveAdmin.register SubmissionFileDefinition do
  belongs_to :challenge
  navigation_menu :challenge

  controller do
    def permitted_params
      params.permit!
    end
  end

end
