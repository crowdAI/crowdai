require "rails_helper"

RSpec.describe DatasetFilesController, type: :routing do
  describe "valid routing with challenges" do
    it "routes to #index" do
      expect(:get => "/challenges/1/dataset_files").to route_to("dataset_files#index", challenge_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/challenges/1/dataset_files/new").to route_to("dataset_files#new", challenge_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/challenges/1/dataset_files/1").to route_to("dataset_files#show", :id => "1", challenge_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/challenges/1/dataset_files").to route_to("dataset_files#create", challenge_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/challenges/1/dataset_files/1").to route_to("dataset_files#destroy", :id => "1", challenge_id: "1")
    end
  end

  describe "invalid routing with challenges" do
    it "does not route to #edit" do
      expect(:get => "/challenges/1/dataset_files/1/edit").not_to be_routable
    end

    it "does not route to #update via PUT" do
      expect(:put => "/challenges/1/dataset_files/1").not_to be_routable
    end

    it "does not route to #update via PATCH" do
      expect(:patch => "/challenges/1/dataset_files/1").not_to be_routable
    end

  end

  describe "invalid routing with not nested" do
    it "does not route to #index" do
      expect(:get => "/dataset_files").not_to be_routable
    end

    it "does not route to #new" do
      expect(:get => "/dataset_files/new").not_to be_routable
    end

    it "does not route to #show" do
      expect(:get => "/dataset_files/1").not_to be_routable
    end

    it "does not route to #edit" do
      expect(:get => "/dataset_files/1/edit").not_to be_routable
    end

    it "does not route to #create" do
      expect(:post => "/dataset_files").not_to be_routable
    end

    it "does not route to #update via PUT" do
      expect(:put => "/dataset_files/1").not_to be_routable
    end

    it "does not route to #update via PATCH" do
      expect(:patch => "/dataset_files/1").not_to be_routable
    end

    it "does not route to #destroy" do
      expect(:delete => "/dataset_files/1").not_to be_routable
    end

  end
end
