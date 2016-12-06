require 'rails_helper'

RSpec.describe "email_preferences/show", type: :view do
  before(:each) do
    @email_preference = assign(:email_preference, EmailPreference.create!(
      :participant => nil,
      :opt_out_all => false,
      :newsletter => false,
      :leaderboard_entry => false,
      :any_post => false,
      :my_topic_post => false,
      :new_leader => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
