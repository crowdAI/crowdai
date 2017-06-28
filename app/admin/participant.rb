ActiveAdmin.register Participant do
  permit_params :email, :password, :password_confirmation

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  permit_params :name, :organizer_id, :email, :email_public, :bio, :website, :github, :linkedin, :twitter, :api_key, :location, :image_file, :password, :password_confirmation, :admin
  form do |f|
    f.inputs "Participant Details" do
      f.input :name
      f.input :organizer, :as => :select, :collection => Organizer.all.collect {|organizer| [organizer.organizer, organizer.id] }, :include_blank => true
      f.input :email
      f.input :email_public, as: :boolean
      f.input :bio
      f.input :website
      f.input :github
      f.input :linkedin
      f.input :twitter
      f.input :api_key
      f.input :location
      f.input :image_file
      f.input :password
      f.input :password_confirmation
      f.input :admin, as: :boolean

    end
    f.actions
  end

end
