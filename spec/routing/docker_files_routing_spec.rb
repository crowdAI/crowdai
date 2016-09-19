require "rails_helper"

RSpec.describe DockerFilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/docker_files").to route_to("docker_files#index")
    end

    it "routes to #new" do
      expect(:get => "/docker_files/new").to route_to("docker_files#new")
    end

    it "routes to #show" do
      expect(:get => "/docker_files/1").to route_to("docker_files#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/docker_files/1/edit").to route_to("docker_files#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/docker_files").to route_to("docker_files#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/docker_files/1").to route_to("docker_files#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/docker_files/1").to route_to("docker_files#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/docker_files/1").to route_to("docker_files#destroy", :id => "1")
    end

  end
end
