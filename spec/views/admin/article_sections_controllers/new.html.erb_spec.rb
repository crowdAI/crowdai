require 'rails_helper'

RSpec.describe "admin/article_sections_controllers/new", type: :view do
  before(:each) do
    assign(:admin_article_sections_controller, Admin::ArticleSectionsController.new())
  end

  it "renders new admin_article_sections_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_article_sections_controllers_path, "post" do
    end
  end
end
