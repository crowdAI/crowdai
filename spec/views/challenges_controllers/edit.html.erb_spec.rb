require 'rails_helper'

RSpec.describe "challenges_controllers/edit", type: :view do
  before(:each) do
    @challenges_controller = assign(:challenges_controller, ChallengesController.create!())
  end

  it "renders the edit challenges_controller form" do
    render

    assert_select "form[action=?][method=?]", challenges_controller_path(@challenges_controller), "post" do
    end
  end
end
