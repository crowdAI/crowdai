require 'rails_helper'

RSpec.describe "challenges_controllers/show", type: :view do
  before(:each) do
    @challenges_controller = assign(:challenges_controller, ChallengesController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
