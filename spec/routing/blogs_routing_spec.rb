require "rails_helper"

RSpec.describe BlogsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/blogs").to route_to("blogs#index")
    end

    it "routes to #new" do
      expect(:get => "/blogs/new").to route_to("blogs#new")
    end

    it "routes to #show" do
      expect(:get => "/blogs/1").to route_to("blogs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/blogs/1/edit").to route_to("blogs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/blogs").to route_to("blogs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/blogs/1").to route_to("blogs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/blogs/1").to route_to("blogs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/blogs/1").to route_to("blogs#destroy", :id => "1")
    end

  end
end
