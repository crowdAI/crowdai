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

  permit_params :organizer, :address, :description, :approved, :image_file, :tagline
  form do |f|
    f.inputs "Challenge" do
      f.input :organizer
      f.input :address
      f.input :description
      f.input :approved, as: :boolean
      f.input :image_file
      f.input :tagline
    end
    f.actions
  end

end
