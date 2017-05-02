require 'rails_helper'

RSpec.describe "articles_controllers/new", type: :view do
  before(:each) do
    assign(:articles_controller, ArticlesController.new())
  end

  it "renders new articles_controller form" do
    render

    assert_select "form[action=?][method=?]", articles_controllers_path, "post" do
    end
  end
end
