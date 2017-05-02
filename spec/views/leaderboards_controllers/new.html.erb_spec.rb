require 'rails_helper'

RSpec.describe "leaderboards_controllers/new", type: :view do
  before(:each) do
    assign(:leaderboards_controller, LeaderboardsController.new())
  end

  it "renders new leaderboards_controller form" do
    render

    assert_select "form[action=?][method=?]", leaderboards_controllers_path, "post" do
    end
  end
end
