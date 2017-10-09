require "rails_helper"

RSpec.describe PagesController, type: :routing do
  describe "routing" do

    it "routes to #contact" do
      expect(:get => "/contact").to route_to("pages#contact")
    end

    it "routes to #new" do
      expect(:get => "/privacy").to route_to("pages#privacy")
    end

    it "routes to #show" do
      expect(:get => "/terms").to route_to("pages#terms")
    end

    it "routes to #faq" do
      expect(:get => "/faq").to route_to("pages#faq")
    end

  end
end
