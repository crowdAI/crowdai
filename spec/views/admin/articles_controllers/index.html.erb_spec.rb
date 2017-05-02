require 'rails_helper'

RSpec.describe "admin/articles_controllers/index", type: :view do
  before(:each) do
    assign(:admin_articles_controllers, [
      Admin::ArticlesController.create!(),
      Admin::ArticlesController.create!()
    ])
  end

  it "renders a list of admin/articles_controllers" do
    render
  end
end
