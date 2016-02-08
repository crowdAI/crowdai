require 'rails_helper'

RSpec.describe "teams/index", type: :view do
  before(:each) do
    assign(:teams, [
      Team.create!(
        :team => "Team",
        :description => "MyText"
      ),
      Team.create!(
        :team => "Team",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of teams" do
    render
    assert_select "tr>td", :text => "Team".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
