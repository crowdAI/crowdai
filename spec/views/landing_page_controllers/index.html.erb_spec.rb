require 'rails_helper'

RSpec.describe "landing_page_controllers/index", type: :view do
  before(:each) do
    assign(:landing_page_controllers, [
      LandingPageController.create!(),
      LandingPageController.create!()
    ])
  end

  it "renders a list of landing_page_controllers" do
    render
  end
end
