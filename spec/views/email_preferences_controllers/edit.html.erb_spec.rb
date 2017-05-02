require 'rails_helper'

RSpec.describe "email_preferences_controllers/edit", type: :view do
  before(:each) do
    @email_preferences_controller = assign(:email_preferences_controller, EmailPreferencesController.create!())
  end

  it "renders the edit email_preferences_controller form" do
    render

    assert_select "form[action=?][method=?]", email_preferences_controller_path(@email_preferences_controller), "post" do
    end
  end
end
