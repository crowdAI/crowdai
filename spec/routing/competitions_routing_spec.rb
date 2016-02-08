require "rails_helper"

RSpec.describe CompetitionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/competitions").to route_to("competitions#index")
    end

    it "routes to #new" do
      expect(:get => "/competitions/new").to route_to("competitions#new")
    end

    it "routes to #show" do
      expect(:get => "/competitions/1").to route_to("competitions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/competitions/1/edit").to route_to("competitions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/competitions").to route_to("competitions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/competitions/1").to route_to("competitions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/competitions/1").to route_to("competitions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/competitions/1").to route_to("competitions#destroy", :id => "1")
    end

  end
end
