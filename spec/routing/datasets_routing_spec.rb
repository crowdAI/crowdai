require "rails_helper"

RSpec.describe DatasetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/datasets").to route_to("datasets#index")
    end

    it "routes to #new" do
      expect(:get => "/datasets/new").to route_to("datasets#new")
    end

    it "routes to #show" do
      expect(:get => "/datasets/1").to route_to("datasets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/datasets/1/edit").to route_to("datasets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/datasets").to route_to("datasets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/datasets/1").to route_to("datasets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/datasets/1").to route_to("datasets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/datasets/1").to route_to("datasets#destroy", :id => "1")
    end

  end
end
