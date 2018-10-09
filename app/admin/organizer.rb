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
    column :clef_organizer
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

  action_item :details, only: :show do
    link_to 'Organizer Details', organizer_path(params[:id])
  end


end
