require 'rails_helper'

RSpec.describe "email_preferences/new", type: :view do
  before(:each) do
    assign(:email_preference, EmailPreference.new(
      :participant => nil,
      :opt_out_all => false,
      :newsletter => false,
      :leaderboard_entry => false,
      :any_post => false,
      :my_topic_post => false,
      :new_leader => false
    ))
  end

  it "renders new email_preference form" do
    render

    assert_select "form[action=?][method=?]", email_preferences_path, "post" do

      assert_select "input#email_preference_participant_id[name=?]", "email_preference[participant_id]"

      assert_select "input#email_preference_opt_out_all[name=?]", "email_preference[opt_out_all]"

      assert_select "input#email_preference_newsletter[name=?]", "email_preference[newsletter]"

      assert_select "input#email_preference_leaderboard_entry[name=?]", "email_preference[leaderboard_entry]"

      assert_select "input#email_preference_any_post[name=?]", "email_preference[any_post]"

      assert_select "input#email_preference_my_topic_post[name=?]", "email_preference[my_topic_post]"

      assert_select "input#email_preference_new_leader[name=?]", "email_preference[new_leader]"
    end
  end
end
