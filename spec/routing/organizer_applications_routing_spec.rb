require "rails_helper"

RSpec.describe OrganizerApplicationsController, type: :routing do
  context "routable" do
    it "routes to #create" do
      expect(:post => "/organizer_applications").to route_to("organizer_applications#create")
    end
  end

end
