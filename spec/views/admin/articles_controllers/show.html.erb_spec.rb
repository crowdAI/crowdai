require 'rails_helper'

RSpec.describe "admin/articles_controllers/show", type: :view do
  before(:each) do
    @admin_articles_controller = assign(:admin_articles_controller, Admin::ArticlesController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
