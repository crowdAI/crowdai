require 'rails_helper'

RSpec.describe "active_admin/base_controllers/show", type: :view do
  before(:each) do
    @active_admin_base_controller = assign(:active_admin_base_controller, ActiveAdmin::BaseController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
