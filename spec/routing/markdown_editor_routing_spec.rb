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
end
