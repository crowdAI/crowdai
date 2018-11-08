ActiveAdmin.register Doorkeeper::Application do
  menu parent: "Settings"
  actions :index, :show

=begin
  sidebar "Oauth Access", only: [:show, :edit] do
    ul do
      li link_to "Access Grants", admin_doorkeeper_applications_doorkeeper_access_grant(doorkeeper_application)
      li link_to "Access Tokens", admin_doorkeeper_applications_doorkeeper_access_grant(doorkeeper_application)
    end
  end
=end

  index do
    column :id
    column :name
    column :redirect_uri
    column :scopes
    column :reponses do |res|
      res.access_grants.count
    end
    column :reponses do |res|
      res.access_tokens.count
    end
    actions
  end

end
