require 'rails_helper'

RSpec.describe "email_preferences_controllers/show", type: :view do
  before(:each) do
    @email_preferences_controller = assign(:email_preferences_controller, EmailPreferencesController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
