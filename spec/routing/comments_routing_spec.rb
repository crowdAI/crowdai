require "rails_helper"

RSpec.describe CommentsController, type: :routing do
  describe "routing with topics" do

    it "routes to #new" do
      expect(:get => "/topics/1/comments/new").to route_to("comments#new", topic_id: "1")
    end

    #it "routes to #edit" do
    #  expect(:get => "/topics/1/comments/1/edit").to route_to("comments#edit", topic_id: "1", :id => "1")
    #end

    it "routes to #create" do
      expect(:post => "/topics/1/comments").to route_to("comments#create", topic_id: "1")
    end

    #it "routes to #update via PUT" do
    #  expect(:put => "/topics/1/comments/1").to route_to("comments#update", topic_id: "1", :id => "1")
    #end

    #it "routes to #update via PATCH" do
    #  expect(:patch => "/topics/1/comments/1").to route_to("comments#update", topic_id: "1", :id => "1")
    #end

    #it "routes to #destroy" do
    #  expect(:delete => "/topics/1/comments/1").to route_to("comments#destroy",topic_id: "1", :id => "1")
    #end
  end

end
