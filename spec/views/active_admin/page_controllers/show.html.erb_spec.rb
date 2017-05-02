require 'rails_helper'

RSpec.describe "active_admin/page_controllers/show", type: :view do
  before(:each) do
    @active_admin_page_controller = assign(:active_admin_page_controller, ActiveAdmin::PageController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
