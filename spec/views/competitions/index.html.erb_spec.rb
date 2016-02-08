require 'rails_helper'

RSpec.describe "competitions/index", type: :view do
  before(:each) do
    assign(:competitions, [
      Competition.create!(
        :hosting_institution => nil,
        :competition => "",
        :status_cd => "Status Cd",
        :description => "MyText",
        :evaluation => "MyText",
        :evaluation_criteria => "MyText",
        :rules => "MyText",
        :prizes => "MyText",
        :resources => "MyText"
      ),
      Competition.create!(
        :hosting_institution => nil,
        :competition => "",
        :status_cd => "Status Cd",
        :description => "MyText",
        :evaluation => "MyText",
        :evaluation_criteria => "MyText",
        :rules => "MyText",
        :prizes => "MyText",
        :resources => "MyText"
      )
    ])
  end

  it "renders a list of competitions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Status Cd".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
