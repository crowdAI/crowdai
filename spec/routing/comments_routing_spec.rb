require "rails_helper"

RSpec.describe CommentsController, type: :routing do
  describe "routing with topics" do

    it "routes to #new" do
      expect(:get => "/topics/1/comments/new").to route_to("comments#new", topic_id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/topics/1/comments/1/edit").to route_to("comments#edit", topic_id: "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/topics/1/comments").to route_to("comments#create", topic_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/topics/1/comments/1").to route_to("comments#update", topic_id: "1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/topics/1/comments/1").to route_to("comments#update", topic_id: "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/topics/1/comments/1").to route_to("comments#destroy",topic_id: "1", :id => "1")
    end
  end

  describe 'invalid routing with topics' do
    it "does not route to #show" do
      expect(:get => "/topics/1/comments/1").not_to be_routable
    end

    it "does not route to #index" do
      expect(:get => "/topics/1/comments").not_to be_routable
    end
  end

  describe "invalid comments only routing" do

    it "does not route to #index" do
      expect(:get => "/comments").not_to be_routable
    end

    it "does not route to #new" do
      expect(:get => "/comments/new").not_to be_routable
    end

    it "does not route to #show" do
      expect(:get => "/comments/1").not_to be_routable
    end

    it "does not route to #edit" do
      expect(:get => "/comments/1/edit").not_to be_routable
    end

    it "does not route to #create" do
      expect(:post => "/comments").not_to be_routable
    end

    it "does not route to #update via PUT" do
      expect(:put => "/comments/1").not_to be_routable
    end

    it "does not route to #update via PATCH" do
      expect(:patch => "/comments/1").not_to be_routable
    end

    it "does not route to #destroy" do
      expect(:delete => "/comments/1").not_to be_routable
    end

  end


end
