require 'rails_helper'

RSpec.describe "admin/mailers_controllers/show", type: :view do
  before(:each) do
    @admin_mailers_controller = assign(:admin_mailers_controller, Admin::MailersController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
