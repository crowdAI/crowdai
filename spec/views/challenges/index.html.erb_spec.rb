require 'rails_helper'

RSpec.describe "challenges/index", type: :view do
  before(:each) do
    assign(:challenges, [
      Challenge.create!(
        :organizer => nil,
        :challenge => "",
        :status_cd => "Status Cd",
        :description => "MyText",
        :evaluation => "MyText",
        :evaluation_criteria => "MyText",
        :rules => "MyText",
        :prizes => "MyText",
        :resources => "MyText"
      ),
      Challenge.create!(
        :organizer => nil,
        :challenge => "",
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

  it "renders a list of challenges" do
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
