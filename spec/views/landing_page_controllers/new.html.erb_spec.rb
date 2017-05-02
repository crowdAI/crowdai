require 'rails_helper'

RSpec.describe "landing_page_controllers/new", type: :view do
  before(:each) do
    assign(:landing_page_controller, LandingPageController.new())
  end

  it "renders new landing_page_controller form" do
    render

    assert_select "form[action=?][method=?]", landing_page_controllers_path, "post" do
    end
  end
end
