require 'rails_helper'

RSpec.describe "participants_controllers/new", type: :view do
  before(:each) do
    assign(:participants_controller, ParticipantsController.new())
  end

  it "renders new participants_controller form" do
    render

    assert_select "form[action=?][method=?]", participants_controllers_path, "post" do
    end
  end
end
