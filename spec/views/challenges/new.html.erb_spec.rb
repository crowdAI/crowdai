require 'rails_helper'

RSpec.describe "challenges/new", type: :view do
  before(:each) do
    assign(:challenge, Challenge.new())
  end

  it "renders new challenge form" do
    render

    assert_select "form[action=?][method=?]", challenges_path, "post" do
    end
  end
end
