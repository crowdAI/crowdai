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

end
