require "rails_helper"

RSpec.describe ArticleSectionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/articles/5/article_sections").to route_to("article_sections#index", article_id: "5")
    end

    it "routes to #new" do
      expect(:get => "/articles/5/article_sections/new").to route_to("article_sections#new", article_id: "5")
    end

    it "routes to #show" do
      expect(:get => "/articles/5/article_sections/1").to route_to("article_sections#show", article_id: "5", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/articles/5/article_sections/1/edit").to route_to("article_sections_controllers#edit", article_id: 5, :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/articles/5/article_sections").to route_to("article_sections_controllers#create", article_id: 5)
    end

    it "routes to #update via PUT" do
      expect(:put => "/articles/5/article_sections/1").to route_to("article_sections#update", article_id: 5, :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/articles/5/article_sections/1").to route_to("article_sections#update", article_id: 5, :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/articles/5/article_sections/1").to route_to("article_sections#destroy", article_id: 5, :id => "1")
    end

  end
end
