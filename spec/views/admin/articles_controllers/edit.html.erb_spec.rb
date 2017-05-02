require 'rails_helper'

RSpec.describe "admin/articles_controllers/edit", type: :view do
  before(:each) do
    @admin_articles_controller = assign(:admin_articles_controller, Admin::ArticlesController.create!())
  end

  it "renders the edit admin_articles_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_articles_controller_path(@admin_articles_controller), "post" do
    end
  end
end
