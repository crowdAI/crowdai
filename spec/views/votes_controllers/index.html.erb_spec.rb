require 'rails_helper'

RSpec.describe "votes_controllers/index", type: :view do
  before(:each) do
    assign(:votes_controllers, [
      VotesController.create!(),
      VotesController.create!()
    ])
  end

  it "renders a list of votes_controllers" do
    render
  end
end
