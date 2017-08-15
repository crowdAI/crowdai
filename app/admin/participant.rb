ActiveAdmin.register Participant do

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
  filter :api_key
  filter :github
  filter :twitter
  filter :linkedin
  filter :location

  member_action :enable_account do
    resource.enable_account
    redirect_to admin_participant_path(resource)
  end

  member_action :disable_account do
    resource.disable_account("Account disabled by administrator #{current_participant.name}")
    redirect_to admin_participant_path(resource)
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

  action_item :disable, only: :show do
    if resource.account_disabled
      link_to 'Enable account', enable_account_admin_participant_path(resource)
    else
      link_to 'Disable account', disable_account_admin_participant_path(resource)
    end
  end

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

  permit_params :email,
                :password,
                :password_confirmation,
                :name,
                :organizer,
                :email,
                :email_public,
                :bio,
                :website,
                :github,
                :linkedin,
                :twitter,
                :api_key,
                :location,
                :image_file,
                :admin

end
