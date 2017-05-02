require 'rails_helper'

RSpec.describe "email_preferences_controllers/index", type: :view do
  before(:each) do
    assign(:email_preferences_controllers, [
      EmailPreferencesController.create!(),
      EmailPreferencesController.create!()
    ])
  end

  it "renders a list of email_preferences_controllers" do
    render
  end
end
