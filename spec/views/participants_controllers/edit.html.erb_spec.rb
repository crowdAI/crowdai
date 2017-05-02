require 'rails_helper'

RSpec.describe "participants_controllers/edit", type: :view do
  before(:each) do
    @participants_controller = assign(:participants_controller, ParticipantsController.create!())
  end

  it "renders the edit participants_controller form" do
    render

    assert_select "form[action=?][method=?]", participants_controller_path(@participants_controller), "post" do
    end
  end
end
