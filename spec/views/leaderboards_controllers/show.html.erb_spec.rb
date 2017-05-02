require 'rails_helper'

RSpec.describe "leaderboards_controllers/show", type: :view do
  before(:each) do
    @leaderboards_controller = assign(:leaderboards_controller, LeaderboardsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
