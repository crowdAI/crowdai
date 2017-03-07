require "rails_helper"

RSpec.describe MailersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mailers").to route_to("mailers#index")
    end

    it "routes to #new" do
      expect(:get => "/mailers/new").to route_to("mailers#new")
    end

    it "routes to #show" do
      expect(:get => "/mailers/1").to route_to("mailers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mailers/1/edit").to route_to("mailers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mailers").to route_to("mailers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mailers/1").to route_to("mailers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mailers/1").to route_to("mailers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mailers/1").to route_to("mailers#destroy", :id => "1")
    end

  end
end
