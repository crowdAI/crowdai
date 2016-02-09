# == Schema Information
#
# Table name: dataset_files
#
#  id         :integer          not null, primary key
#  dataset_id :integer
#  seq        :integer
#  filename   :string
#  filetype   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe DatasetFilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dataset_files").to route_to("dataset_files#index")
    end

    it "routes to #new" do
      expect(:get => "/dataset_files/new").to route_to("dataset_files#new")
    end

    it "routes to #show" do
      expect(:get => "/dataset_files/1").to route_to("dataset_files#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dataset_files/1/edit").to route_to("dataset_files#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/dataset_files").to route_to("dataset_files#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/dataset_files/1").to route_to("dataset_files#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/dataset_files/1").to route_to("dataset_files#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dataset_files/1").to route_to("dataset_files#destroy", :id => "1")
    end

  end
end
