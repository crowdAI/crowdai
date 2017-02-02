ActiveAdmin.register DatasetFile do

  belongs_to :challenge
  navigation_menu :challenge

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
