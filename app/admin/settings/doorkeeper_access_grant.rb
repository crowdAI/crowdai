ActiveAdmin.register Doorkeeper::AccessGrant do
  menu parent: "Settings"
  actions :index, :show

  #belongs_to :doorkeeper_application
  #navigation_menu :application

  index do
    column :id
    column :resource_owner_id
    column :application_id
    column :expires_in
    column :scopes
    actions
  end

end


#admin_doorkeeper_applications
