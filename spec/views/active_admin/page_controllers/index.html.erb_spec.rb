require 'rails_helper'

RSpec.describe "active_admin/page_controllers/index", type: :view do
  before(:each) do
    assign(:active_admin_page_controllers, [
      ActiveAdmin::PageController.create!(),
      ActiveAdmin::PageController.create!()
    ])
  end

  it "renders a list of active_admin/page_controllers" do
    render
  end
end
