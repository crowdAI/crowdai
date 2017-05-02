require 'rails_helper'

RSpec.describe "admin/participants_controllers/edit", type: :view do
  before(:each) do
    @admin_participants_controller = assign(:admin_participants_controller, Admin::ParticipantsController.create!())
  end

  it "renders the edit admin_participants_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_participants_controller_path(@admin_participants_controller), "post" do
    end
  end
end
