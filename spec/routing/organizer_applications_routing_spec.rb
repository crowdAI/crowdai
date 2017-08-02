require "rails_helper"

RSpec.describe OrganizerApplicationsController, type: :routing do
  context "routable" do
    it "routes to #create" do
      expect(:post => "/organizer_applications").to route_to("organizer_applications#create")
    end
  end

  context "not routable" do
    it "does not route to #index" do
      expect(:get => "/organizer_applications").not_to be_routable
    end

    it "does not route to #new" do
      expect(:get => "/organizer_applications/new").not_to be_routable
    end

    it "does not route to #show" do
      expect(:get => "/organizer_applications/1").not_to be_routable
    end

    it "does not route to #edit" do
      expect(:get => "/organizer_applications/1/edit").not_to be_routable
    end

    it "does not route to #update via PUT" do
      expect(:put => "/organizer_applications/1").not_to be_routable
    end

    it "does not route to #update via PATCH" do
      expect(:patch => "/organizer_applications/1").not_to be_routable
    end

    it "does not route to #destroy" do
      expect(:delete => "/organizer_applications/1").not_to be_routable
    end
  end
end
