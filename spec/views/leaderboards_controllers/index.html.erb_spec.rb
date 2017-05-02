require 'rails_helper'

RSpec.describe "leaderboards_controllers/index", type: :view do
  before(:each) do
    assign(:leaderboards_controllers, [
      LeaderboardsController.create!(),
      LeaderboardsController.create!()
    ])
  end

  it "renders a list of leaderboards_controllers" do
    render
  end
end
