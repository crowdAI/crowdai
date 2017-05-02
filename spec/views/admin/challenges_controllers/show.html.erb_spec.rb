require 'rails_helper'

RSpec.describe "admin/challenges_controllers/show", type: :view do
  before(:each) do
    @admin_challenges_controller = assign(:admin_challenges_controller, Admin::ChallengesController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
