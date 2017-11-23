ActiveAdmin.register OrganizerApplication do

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    id_column
    column :contact_name
    column :email
    column :phone
    column :organization
    actions
  end



end
