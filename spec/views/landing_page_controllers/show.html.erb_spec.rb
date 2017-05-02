require 'rails_helper'

RSpec.describe "landing_page_controllers/show", type: :view do
  before(:each) do
    @landing_page_controller = assign(:landing_page_controller, LandingPageController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
