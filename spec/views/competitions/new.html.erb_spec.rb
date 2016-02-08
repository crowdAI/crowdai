require 'rails_helper'

RSpec.describe "competitions/new", type: :view do
  before(:each) do
    assign(:competition, Competition.new(
      :hosting_institution => nil,
      :competition => "",
      :status_cd => "MyString",
      :description => "MyText",
      :evaluation => "MyText",
      :evaluation_criteria => "MyText",
      :rules => "MyText",
      :prizes => "MyText",
      :resources => "MyText"
    ))
  end

  it "renders new competition form" do
    render

    assert_select "form[action=?][method=?]", competitions_path, "post" do

      assert_select "input#competition_hosting_institution_id[name=?]", "competition[hosting_institution_id]"

      assert_select "input#competition_competition[name=?]", "competition[competition]"

      assert_select "input#competition_status_cd[name=?]", "competition[status_cd]"

      assert_select "textarea#competition_description[name=?]", "competition[description]"

      assert_select "textarea#competition_evaluation[name=?]", "competition[evaluation]"

      assert_select "textarea#competition_evaluation_criteria[name=?]", "competition[evaluation_criteria]"

      assert_select "textarea#competition_rules[name=?]", "competition[rules]"

      assert_select "textarea#competition_prizes[name=?]", "competition[prizes]"

      assert_select "textarea#competition_resources[name=?]", "competition[resources]"
    end
  end
end
