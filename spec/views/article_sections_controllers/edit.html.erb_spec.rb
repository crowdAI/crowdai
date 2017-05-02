require 'rails_helper'

RSpec.describe "article_sections_controllers/edit", type: :view do
  before(:each) do
    @article_sections_controller = assign(:article_sections_controller, ArticleSectionsController.create!())
  end

  it "renders the edit article_sections_controller form" do
    render

    assert_select "form[action=?][method=?]", article_sections_controller_path(@article_sections_controller), "post" do
    end
  end
end
