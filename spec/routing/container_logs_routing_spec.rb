require "rails_helper"

RSpec.describe ContainerLogsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/container_logs").to route_to("container_logs#index")
    end

    it "routes to #new" do
      expect(:get => "/container_logs/new").to route_to("container_logs#new")
    end

    it "routes to #show" do
      expect(:get => "/container_logs/1").to route_to("container_logs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/container_logs/1/edit").to route_to("container_logs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/container_logs").to route_to("container_logs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/container_logs/1").to route_to("container_logs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/container_logs/1").to route_to("container_logs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/container_logs/1").to route_to("container_logs#destroy", :id => "1")
    end

  end
end
