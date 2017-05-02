require 'rails_helper'

RSpec.describe "submissions_controllers/new", type: :view do
  before(:each) do
    assign(:submissions_controller, SubmissionsController.new())
  end

  it "renders new submissions_controller form" do
    render

    assert_select "form[action=?][method=?]", submissions_controllers_path, "post" do
    end
  end
end
