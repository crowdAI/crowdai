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

end
