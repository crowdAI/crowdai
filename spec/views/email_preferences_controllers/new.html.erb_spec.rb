require 'rails_helper'

RSpec.describe "email_preferences_controllers/new", type: :view do
  before(:each) do
    assign(:email_preferences_controller, EmailPreferencesController.new())
  end

  it "renders new email_preferences_controller form" do
    render

    assert_select "form[action=?][method=?]", email_preferences_controllers_path, "post" do
    end
  end
end
