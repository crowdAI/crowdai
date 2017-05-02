require 'rails_helper'

RSpec.describe "leaderboards_controllers/edit", type: :view do
  before(:each) do
    @leaderboards_controller = assign(:leaderboards_controller, LeaderboardsController.create!())
  end

  it "renders the edit leaderboards_controller form" do
    render

    assert_select "form[action=?][method=?]", leaderboards_controller_path(@leaderboards_controller), "post" do
    end
  end
end
