require 'rails_helper'

RSpec.describe "admin/participants_controllers/new", type: :view do
  before(:each) do
    assign(:admin_participants_controller, Admin::ParticipantsController.new())
  end

  it "renders new admin_participants_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_participants_controllers_path, "post" do
    end
  end
end
