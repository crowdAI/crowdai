require 'rails_helper'

RSpec.describe "article_sections_controllers/index", type: :view do
  before(:each) do
    assign(:article_sections_controllers, [
      ArticleSectionsController.create!(),
      ArticleSectionsController.create!()
    ])
  end

  it "renders a list of article_sections_controllers" do
    render
  end
end
