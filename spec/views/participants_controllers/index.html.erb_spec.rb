require 'rails_helper'

RSpec.describe "participants_controllers/index", type: :view do
  before(:each) do
    assign(:participants_controllers, [
      ParticipantsController.create!(),
      ParticipantsController.create!()
    ])
  end

  it "renders a list of participants_controllers" do
    render
  end
end
