require 'rails_helper'

RSpec.describe "admin/participants_controllers/show", type: :view do
  before(:each) do
    @admin_participants_controller = assign(:admin_participants_controller, Admin::ParticipantsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
