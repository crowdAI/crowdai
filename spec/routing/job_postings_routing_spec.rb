require "rails_helper"

RSpec.describe JobPostingsController, type: :routing do
  describe "valid routing" do
    it "routes to #index" do
      expect(:get => "/job_postings").to route_to("job_postings#index")
    end

    it "routes to #show" do
      expect(:get => "/job_postings/1").to route_to("job_postings#show", :id => "1")
    end
  end

  describe "invalid routing" do
    it "does not route to #new" do
      #expect(:get => "/job_postings/new").not_to be_routable
    end

    it "does not route  to #edit" do
      expect(:get => "/job_postings/1/edit").not_to be_routable
    end

    it "does not route  to #create" do
      expect(:post => "/job_postings").not_to be_routable
    end

    it "does not route  to #update via PUT" do
      expect(:put => "/job_postings/1").not_to be_routable
    end

    it "does not route  to #update via PATCH" do
      expect(:patch => "/job_postings/1").not_to be_routable
    end

    it "does not route  to #destroy" do
      expect(:delete => "/job_postings/1").not_to be_routable
    end

  end
end
