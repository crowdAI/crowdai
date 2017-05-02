require 'rails_helper'

RSpec.describe "admin/articles_controllers/new", type: :view do
  before(:each) do
    assign(:admin_articles_controller, Admin::ArticlesController.new())
  end

  it "renders new admin_articles_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_articles_controllers_path, "post" do
    end
  end
end
