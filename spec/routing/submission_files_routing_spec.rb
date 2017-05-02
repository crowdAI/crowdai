require "rails_helper"

RSpec.describe SubmissionFilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/submission_files").to route_to("submission_files#index")
    end

    it "routes to #new" do
      expect(:get => "/submission_files/new").to route_to("submission_files#new")
    end

    it "routes to #show" do
      expect(:get => "/submission_files/1").to route_to("submission_files#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/submission_files/1/edit").to route_to("submission_files#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/submission_files").to route_to("submission_files#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/submission_files/1").to route_to("submission_files#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/submission_files/1").to route_to("submission_files#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/submission_files/1").to route_to("submission_files#destroy", :id => "1")
    end

  end
end
