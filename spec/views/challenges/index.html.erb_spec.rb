require 'rails_helper'

RSpec.describe "challenges/index", type: :view do
  before(:each) do
    assign(:challenges, [
      Challenge.create!(),
      Challenge.create!()
    ])
  end

  it "renders a list of challenges" do
    render
  end
end
