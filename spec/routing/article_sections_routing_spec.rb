require "rails_helper"

RSpec.describe ArticleSectionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/article_sections").to route_to("article_sections#index")
    end

    it "routes to #new" do
      expect(:get => "/article_sections/new").to route_to("article_sections#new")
    end

    it "routes to #show" do
      expect(:get => "/article_sections/1").to route_to("article_sections#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/article_sections/1/edit").to route_to("article_sections#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/article_sections").to route_to("article_sections#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/article_sections/1").to route_to("article_sections#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/article_sections/1").to route_to("article_sections#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/article_sections/1").to route_to("article_sections#destroy", :id => "1")
    end

  end
end
