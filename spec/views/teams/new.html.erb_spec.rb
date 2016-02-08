require 'rails_helper'

RSpec.describe "teams/new", type: :view do
  before(:each) do
    assign(:team, Team.new(
      :team => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new team form" do
    render

    assert_select "form[action=?][method=?]", teams_path, "post" do

      assert_select "input#team_team[name=?]", "team[team]"

      assert_select "textarea#team_description[name=?]", "team[description]"
    end
  end
end
