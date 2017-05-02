require "rails_helper"

RSpec.describe MarkdownEditorController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/markdown_editor_controllers").to route_to("markdown_editor_controllers#index")
    end

    it "routes to #new" do
      expect(:get => "/markdown_editor_controllers/new").to route_to("markdown_editor_controllers#new")
    end

    it "routes to #show" do
      expect(:get => "/markdown_editor_controllers/1").to route_to("markdown_editor_controllers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/markdown_editor_controllers/1/edit").to route_to("markdown_editor_controllers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/markdown_editor_controllers").to route_to("markdown_editor_controllers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/markdown_editor_controllers/1").to route_to("markdown_editor_controllers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/markdown_editor_controllers/1").to route_to("markdown_editor_controllers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/markdown_editor_controllers/1").to route_to("markdown_editor_controllers#destroy", :id => "1")
    end

  end
end
