require 'rails_helper'

RSpec.describe "admin/article_sections_controllers/index", type: :view do
  before(:each) do
    assign(:admin_article_sections_controllers, [
      Admin::ArticleSectionsController.create!(),
      Admin::ArticleSectionsController.create!()
    ])
  end

  it "renders a list of admin/article_sections_controllers" do
    render
  end
end
