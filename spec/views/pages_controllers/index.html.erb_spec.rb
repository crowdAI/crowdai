require 'rails_helper'

RSpec.describe "pages_controllers/index", type: :view do
  before(:each) do
    assign(:pages_controllers, [
      PagesController.create!(),
      PagesController.create!()
    ])
  end

  it "renders a list of pages_controllers" do
    render
  end
end
