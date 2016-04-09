
require "rails_helper"

RSpec.describe DatasetFilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/challenges/1/dataset_files").to route_to("dataset_files#index", challenge_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/challenges/1/dataset_files/new").to route_to("dataset_files#new", challenge_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/challenges/1/dataset_files/1").to route_to("dataset_files#show", challenge_id: "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/challenges/1/dataset_files/1/edit").to route_to("dataset_files#edit", challenge_id: "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/challenges/1/dataset_files").to route_to("dataset_files#create", challenge_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/challenges/1/dataset_files/1").to route_to("dataset_files#update", challenge_id: "1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/challenges/1/dataset_files/1").to route_to("dataset_files#update", challenge_id: "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/challenges/1/dataset_files/1").to route_to("dataset_files#destroy", challenge_id: "1", :id => "1")
    end

  end
end
