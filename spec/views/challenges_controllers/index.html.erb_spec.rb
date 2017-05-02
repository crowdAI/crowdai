require 'rails_helper'

RSpec.describe "challenges_controllers/index", type: :view do
  before(:each) do
    assign(:challenges_controllers, [
      ChallengesController.create!(),
      ChallengesController.create!()
    ])
  end

  it "renders a list of challenges_controllers" do
    render
  end
end
