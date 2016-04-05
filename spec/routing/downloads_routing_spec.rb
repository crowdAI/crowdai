require "rails_helper"

RSpec.describe DownloadsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/downloads").to route_to("downloads#index")
    end

    it "routes to #new" do
      expect(:get => "/downloads/new").to route_to("downloads#new")
    end

    it "routes to #show" do
      expect(:get => "/downloads/1").to route_to("downloads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/downloads/1/edit").to route_to("downloads#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/downloads").to route_to("downloads#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/downloads/1").to route_to("downloads#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/downloads/1").to route_to("downloads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/downloads/1").to route_to("downloads#destroy", :id => "1")
    end

  end
end
