require 'rails_helper'

RSpec.describe "challenges/new", type: :view do
  before(:each) do
    assign(:challenge, Challenge.new(
      :organizer => nil,
      :challenge => "",
      :status_cd => "MyString",
      :description => "MyText",
      :evaluation => "MyText",
      :evaluation_criteria => "MyText",
      :rules => "MyText",
      :prizes => "MyText",
      :resources => "MyText"
    ))
  end

  it "renders new challenge form" do
    render

    assert_select "form[action=?][method=?]", challenges_path, "post" do

      assert_select "input#challenge_organizer_id[name=?]", "challenge[organizer_id]"

      assert_select "input#challenge_challenge[name=?]", "challenge[challenge]"

      assert_select "input#challenge_status_cd[name=?]", "challenge[status_cd]"

      assert_select "textarea#challenge_description[name=?]", "challenge[description]"

      assert_select "textarea#challenge_evaluation[name=?]", "challenge[evaluation]"

      assert_select "textarea#challenge_evaluation_criteria[name=?]", "challenge[evaluation_criteria]"

      assert_select "textarea#challenge_rules[name=?]", "challenge[rules]"

      assert_select "textarea#challenge_prizes[name=?]", "challenge[prizes]"

      assert_select "textarea#challenge_resources[name=?]", "challenge[resources]"
    end
  end
end
