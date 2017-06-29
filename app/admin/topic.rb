ActiveAdmin.register Topic do
  belongs_to :challenge
  navigation_menu :challenge

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
    def permitted_params
      params.permit!
    end
  end
  
end
