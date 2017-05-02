require 'rails_helper'

RSpec.describe "article_sections_controllers/new", type: :view do
  before(:each) do
    assign(:article_sections_controller, ArticleSectionsController.new())
  end

  it "renders new article_sections_controller form" do
    render

    assert_select "form[action=?][method=?]", article_sections_controllers_path, "post" do
    end
  end
end
