require 'rails_helper'

RSpec.describe "pages_controllers/show", type: :view do
  before(:each) do
    @pages_controller = assign(:pages_controller, PagesController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
