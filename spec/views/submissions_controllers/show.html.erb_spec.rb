require 'rails_helper'

RSpec.describe "submissions_controllers/show", type: :view do
  before(:each) do
    @submissions_controller = assign(:submissions_controller, SubmissionsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
