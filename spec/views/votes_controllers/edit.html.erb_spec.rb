require 'rails_helper'

RSpec.describe "votes_controllers/edit", type: :view do
  before(:each) do
    @votes_controller = assign(:votes_controller, VotesController.create!())
  end

  it "renders the edit votes_controller form" do
    render

    assert_select "form[action=?][method=?]", votes_controller_path(@votes_controller), "post" do
    end
  end
end
