require 'rails_helper'

RSpec.describe "articles_controllers/edit", type: :view do
  before(:each) do
    @articles_controller = assign(:articles_controller, ArticlesController.create!())
  end

  it "renders the edit articles_controller form" do
    render

    assert_select "form[action=?][method=?]", articles_controller_path(@articles_controller), "post" do
    end
  end
end
