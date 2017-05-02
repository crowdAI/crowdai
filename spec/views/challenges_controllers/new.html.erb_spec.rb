require 'rails_helper'

RSpec.describe "challenges_controllers/new", type: :view do
  before(:each) do
    assign(:challenges_controller, ChallengesController.new())
  end

  it "renders new challenges_controller form" do
    render

    assert_select "form[action=?][method=?]", challenges_controllers_path, "post" do
    end
  end
end
