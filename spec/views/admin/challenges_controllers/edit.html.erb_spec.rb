require 'rails_helper'

RSpec.describe "admin/challenges_controllers/edit", type: :view do
  before(:each) do
    @admin_challenges_controller = assign(:admin_challenges_controller, Admin::ChallengesController.create!())
  end

  it "renders the edit admin_challenges_controller form" do
    render

    assert_select "form[action=?][method=?]", admin_challenges_controller_path(@admin_challenges_controller), "post" do
    end
  end
end
