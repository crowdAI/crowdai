ActiveAdmin.register Organizer do

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    selectable_column
    column :id
    column :organizer
    column :approved
    actions
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
    def permitted_params
      params.permit!
    end
  end


end
