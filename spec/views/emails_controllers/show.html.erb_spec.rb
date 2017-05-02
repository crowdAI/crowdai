require 'rails_helper'

RSpec.describe "emails_controllers/show", type: :view do
  before(:each) do
    @emails_controller = assign(:emails_controller, EmailsController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
