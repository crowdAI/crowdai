require 'rails_helper'

RSpec.describe "admin/emails_controllers/show", type: :view do
  before(:each) do
    @admin_emails_controller = assign(:admin_emails_controller, Admin::EmailsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
