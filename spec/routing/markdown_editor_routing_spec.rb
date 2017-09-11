require "rails_helper"

RSpec.describe MarkdownEditorsController, type: :routing do
  describe "valid routing" do
    it "routes to #index" do
      expect(:get => "/markdown_editors").to route_to("markdown_editors#index")
    end

    it "routes to #presign" do
      expect(put: '/markdown_editors/presign').to route_to("markdown_editors#presign")
    end

    it "routes to #create" do
      expect(:post => "/markdown_editors").to route_to("markdown_editors#create")
    end
  end

  describe "invalid routing" do

    it "routes to #show" do
      expect(:get => "/markdown_editor/1").not_to be_routable
    end

    it "routes to #new" do
      expect(:get => "/markdown_editors/new").not_to be_routable
    end

    it "routes to #show" do
      expect(:get => "/markdown_editors/1").not_to be_routable
    end

    it "routes to #edit" do
      expect(:get => "/markdown_editors/1/edit").not_to be_routable
    end



    it "routes to #update via PUT" do
      expect(:put => "/markdown_editors/1").not_to be_routable
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/markdown_editors/1").not_to be_routable
    end

    it "routes to #destroy" do
      expect(:delete => "/markdown_editors/1").not_to be_routable
    end

  end
end
