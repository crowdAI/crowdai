require 'rails_helper'

RSpec.describe "submissions/index", type: :view do
  before(:each) do
    assign(:submissions, [
      Submission.create!(
        :competition => nil,
        :user => nil,
        :team => nil,
        :evaluated => false,
        :score => 1.5,
        :ranking => 1.5,
        :submission_type_cd => "Submission Type Cd",
        :withdrawn => false
      ),
      Submission.create!(
        :competition => nil,
        :user => nil,
        :team => nil,
        :evaluated => false,
        :score => 1.5,
        :ranking => 1.5,
        :submission_type_cd => "Submission Type Cd",
        :withdrawn => false
      )
    ])
  end

  it "renders a list of submissions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Submission Type Cd".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
