require 'rails_helper'

RSpec.describe "landing_page_controllers/edit", type: :view do
  before(:each) do
    @landing_page_controller = assign(:landing_page_controller, LandingPageController.create!())
  end

  it "renders the edit landing_page_controller form" do
    render

    assert_select "form[action=?][method=?]", landing_page_controller_path(@landing_page_controller), "post" do
    end
  end
end
