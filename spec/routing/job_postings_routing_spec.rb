require "rails_helper"

RSpec.describe JobPostingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/job_postings").to route_to("job_postings#index")
    end

    it "routes to #new" do
      expect(:get => "/job_postings/new").to route_to("job_postings#new")
    end

    it "routes to #show" do
      expect(:get => "/job_postings/1").to route_to("job_postings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/job_postings/1/edit").to route_to("job_postings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/job_postings").to route_to("job_postings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/job_postings/1").to route_to("job_postings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/job_postings/1").to route_to("job_postings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/job_postings/1").to route_to("job_postings#destroy", :id => "1")
    end

  end
end
