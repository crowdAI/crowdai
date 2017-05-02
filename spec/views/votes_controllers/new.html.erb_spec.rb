require 'rails_helper'

RSpec.describe "votes_controllers/new", type: :view do
  before(:each) do
    assign(:votes_controller, VotesController.new())
  end

  it "renders new votes_controller form" do
    render

    assert_select "form[action=?][method=?]", votes_controllers_path, "post" do
    end
  end
end
