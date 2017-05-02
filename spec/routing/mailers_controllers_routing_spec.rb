require "rails_helper"

RSpec.describe MailersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mailers_controllers").to route_to("mailers_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/mailers_controllers/new").to route_to("mailers_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/mailers_controllers/1").to route_to("mailers_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mailers_controllers/1/edit").to route_to("mailers_controllers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mailers_controllers").to route_to("mailers_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mailers_controllers/1").to route_to("mailers_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mailers_controllers/1").to route_to("mailers_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mailers_controllers/1").to route_to("mailers_controllers#destroy", :id => "1")
    end

  end
end
