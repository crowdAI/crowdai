require 'rails_helper'

RSpec.describe "admin/article_sections_controllers/edit", type: :view do
  before(:each) do
    @admin_article_sections_controller = assign(:admin_article_sections_controller, Admin::ArticleSectionsController.create!())
  end

  it "renders the edit admin_article_sections_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_article_sections_controller_path(@admin_article_sections_controller), "post" do
    end
  end
end
