require 'rails_helper'

RSpec.describe "submissions_controllers/edit", type: :view do
  before(:each) do
    @submissions_controller = assign(:submissions_controller, SubmissionsController.create!())
  end

  it "renders the edit submissions_controller form" do
    render

    assert_select "form[action=?][method=?]", submissions_controller_path(@submissions_controller), "post" do
    end
  end
end
