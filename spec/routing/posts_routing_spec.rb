require "rails_helper"

RSpec.describe PostsController, type: :routing do
  describe "invalid routing" do
    it "#show" do
      expect(:get => "/topics/5/posts/1").not_to be_routable
    end

    it "routes to #index" do
      expect(:get => "/topics/5/posts").not_to be_routable
    end
  end


  describe "routing with topics" do
    it "routes to #new" do
      expect(:get => "/topics/5/posts/new").to route_to("posts#new", topic_id: "5")
    end

    it "routes to #edit" do
      expect(:get => "/topics/5/posts/1/edit").to route_to("posts#edit", topic_id: "5", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/topics/5/posts").to route_to("posts#create", topic_id: "5")
    end

    it "routes to #update via PUT" do
      expect(:put => "/topics/5/posts/1").to route_to("posts#update", topic_id: "5", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/topics/5/posts/1").to route_to("posts#update", topic_id: "5", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/topics/5/posts/1").to route_to("posts#destroy", topic_id: "5", :id => "1")
    end

  end
end
