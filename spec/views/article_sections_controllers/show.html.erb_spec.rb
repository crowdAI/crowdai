require 'rails_helper'

RSpec.describe "article_sections_controllers/show", type: :view do
  before(:each) do
    @article_sections_controller = assign(:article_sections_controller, ArticleSectionsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
