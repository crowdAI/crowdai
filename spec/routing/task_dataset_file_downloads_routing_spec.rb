=begin
require "rails_helper"

RSpec.describe TaskDatasetFileDownloadsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/task_dataset_file_downloads").to route_to("task_dataset_file_downloads#index")
    end

    it "routes to #new" do
      expect(:get => "/task_dataset_file_downloads/new").to route_to("task_dataset_file_downloads#new")
    end

    it "routes to #show" do
      expect(:get => "/task_dataset_file_downloads/1").to route_to("task_dataset_file_downloads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/task_dataset_file_downloads/1/edit").to route_to("task_dataset_file_downloads#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/task_dataset_file_downloads").to route_to("task_dataset_file_downloads#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/task_dataset_file_downloads/1").to route_to("task_dataset_file_downloads#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/task_dataset_file_downloads/1").to route_to("task_dataset_file_downloads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/task_dataset_file_downloads/1").to route_to("task_dataset_file_downloads#destroy", :id => "1")
    end

  end
end
=end
