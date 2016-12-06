require 'rails_helper'

RSpec.describe "email_preferences/index", type: :view do
  before(:each) do
    assign(:email_preferences, [
      EmailPreference.create!(
        :participant => nil,
        :opt_out_all => false,
        :newsletter => false,
        :leaderboard_entry => false,
        :any_post => false,
        :my_topic_post => false,
        :new_leader => false
      ),
      EmailPreference.create!(
        :participant => nil,
        :opt_out_all => false,
        :newsletter => false,
        :leaderboard_entry => false,
        :any_post => false,
        :my_topic_post => false,
        :new_leader => false
      )
    ])
  end

  it "renders a list of email_preferences" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
