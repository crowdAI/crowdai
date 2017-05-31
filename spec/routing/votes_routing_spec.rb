require "rails_helper"

RSpec.describe VotesController, type: :routing do
  describe "valid routing" do
    it "routes to topics #create" do
      expect(:post => "/topics/1/votes").to route_to("votes#create", topic_id: "1")
    end

    it "routes to articles #create" do
      expect(:post => "/articles/1/votes").to route_to("votes#create", article_id: "1")
    end

    it "routes to comments #create" do
      expect(:post => "/comments/1/votes").to route_to("votes#create", comment_id: "1")
    end
  end


  describe "invalid routing" do
    it "does not route  to #index" do
      expect(:get => "/votes").not_to be_routable
    end

    it "does not route  to #new" do
      expect(:get => "/votes/new").not_to be_routable
    end

    it "does not route  to #show" do
      expect(:get => "/votes/1").not_to be_routable
    end

    it "does not route  to #edit" do
      expect(:get => "/votes/1/edit").not_to be_routable
    end

    it "does not route  to #create" do
      expect(:post => "/votes").not_to be_routable
    end

    it "does not route  to #update via PUT" do
      expect(:put => "/votes/1").not_to be_routable
    end

    it "does not route  to #update via PATCH" do
      expect(:patch => "/votes/1").not_to be_routable
    end

    it "does not route  to #destroy" do
      expect(:delete => "/votes/1").not_to be_routable
    end

  end
end
