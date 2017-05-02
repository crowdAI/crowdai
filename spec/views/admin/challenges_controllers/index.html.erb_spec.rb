require 'rails_helper'

RSpec.describe "admin/challenges_controllers/index", type: :view do
  before(:each) do
    assign(:admin_challenges_controllers, [
      Admin::ChallengesController.create!(),
      Admin::ChallengesController.create!()
    ])
  end

  it "renders a list of admin/challenges_controllers" do
    render
  end
end
