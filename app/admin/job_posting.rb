ActiveAdmin.register JobPosting do

  controller do
    def permitted_params
      params.permit!
    end
  end

end
