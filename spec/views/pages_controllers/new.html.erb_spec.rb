require 'rails_helper'

RSpec.describe "pages_controllers/new", type: :view do
  before(:each) do
    assign(:pages_controller, PagesController.new())
  end

  it "renders new pages_controller form" do
    render

    assert_select "form[action=?][method=?]", pages_controllers_path, "post" do
    end
  end
end
