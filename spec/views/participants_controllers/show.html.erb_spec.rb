require 'rails_helper'

RSpec.describe "participants_controllers/show", type: :view do
  before(:each) do
    @participants_controller = assign(:participants_controller, ParticipantsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
