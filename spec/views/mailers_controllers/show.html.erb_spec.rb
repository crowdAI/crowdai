require 'rails_helper'

RSpec.describe "mailers_controllers/show", type: :view do
  before(:each) do
    @mailers_controller = assign(:mailers_controller, MailersController.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
