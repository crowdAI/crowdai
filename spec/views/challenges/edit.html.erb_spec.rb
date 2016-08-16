require 'rails_helper'

RSpec.describe "challenges/edit", type: :view do
  before(:each) do
    @challenge = assign(:challenge, Challenge.create!())
  end

  it "renders the edit challenge form" do
    render

    assert_select "form[action=?][method=?]", challenge_path(@challenge), "post" do
    end
  end
end
