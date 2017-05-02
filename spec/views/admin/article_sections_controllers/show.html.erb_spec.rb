require 'rails_helper'

RSpec.describe "admin/article_sections_controllers/show", type: :view do
  before(:each) do
    @admin_article_sections_controller = assign(:admin_article_sections_controller, Admin::ArticleSectionsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
