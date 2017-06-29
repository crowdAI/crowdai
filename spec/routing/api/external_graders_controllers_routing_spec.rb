require "rails_helper"

RSpec.describe Api::ExternalGradersController, type: :routing do
  describe 'routing' do
    it "routes to #show" do
      expect(:get => "/api/external_graders/1").to route_to("api/external_graders#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/external_graders").to route_to("api/external_graders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/external_graders/1").to route_to("api/external_graders#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/external_graders/1").to route_to("api/external_graders#update", id: "1")
    end


  end

  describe "invalid routing" do
    it "#index" do
      expect(:get => "/api/external_graders").not_to be_routable
    end

    #it "#new" do
    #  expect(:get => "/api/external_graders/new").not_to be_routable
    #end

    it "routes to #edit" do
      expect(:get => "/api/external_graders/1/edit").not_to be_routable
    end


    it "routes to #destroy" do
      expect(:delete => "/api/external_graders/1").not_to be_routable
    end
  end
end
