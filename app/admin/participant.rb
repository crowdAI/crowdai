ActiveAdmin.register Participant do
  permit_params :name, :organizer_id, :email, :admin, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :organizer
    column :admin
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end

    def update
      model = :participant
      if params[model][:password].blank?
        %w(password password_confirmation).each { |p| params[model].delete(p) }
      end
      super
    end
  end

  filter :email
  filter :name
  filter :organizer
  filter :admin
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :organizer, :as => :select, :collection => Organizer.all.collect {|organizer| [organizer.organizer, organizer.id] }
      f.input :admin
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
