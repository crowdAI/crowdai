require 'rails_helper'

RSpec.describe "challenges/show", type: :view do
  before(:each) do
    @challenge = assign(:challenge, Challenge.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
