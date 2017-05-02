require 'rails_helper'

RSpec.describe "admin/participants_controllers/index", type: :view do
  before(:each) do
    assign(:admin_participants_controllers, [
      Admin::ParticipantsController.create!(),
      Admin::ParticipantsController.create!()
    ])
  end

  it "renders a list of admin/participants_controllers" do
    render
  end
end
