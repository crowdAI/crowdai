class OrganizerApplicationsController < ApplicationController
  respond_to :js

  def create
    @organizer_application = OrganizerApplication.create!(organizer_application_params)
    render 'landing_page/ajax/application_accepted'
  end

  private
  def organizer_application_params
    params.require(:organizer_application)
          .permit(:contact_name,
                  :email,
                  :phone,
                  :organization,
                  :organization_description,
                  :challenge_description)
  end

end
