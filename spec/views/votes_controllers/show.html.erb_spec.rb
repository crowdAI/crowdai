require 'rails_helper'

RSpec.describe "votes_controllers/show", type: :view do
  before(:each) do
    @votes_controller = assign(:votes_controller, VotesController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
