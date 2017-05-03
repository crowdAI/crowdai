require "rails_helper"

RSpec.describe PagesController, type: :routing do
  describe "routing" do

    it "routes to #contact" do
      expect(:get => "/pages/contact").to route_to("pages#contact")
    end

    it "routes to #new" do
      expect(:get => "/pages/privacy").to route_to("pages#privacy")
    end

    it "routes to #show" do
      expect(:get => "/pages/terms").to route_to("pages#terms")
    end

  end
end
